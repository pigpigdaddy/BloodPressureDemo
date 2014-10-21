//
//  PPDHttpRequest.m
//  HttpRequestUsingBlockDemo
//
//  Created by pigpigdaddy on 14-9-4.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "PPDHttpRequest.h"
#import "ASINetworkQueue.h"
#import "ASIHTTPRequest.h"

@interface PPDHttpRequest ()<ASIHTTPRequestDelegate>

//请求队列
@property (nonatomic, strong) ASINetworkQueue      *queue;

@end

@implementation PPDHttpRequest

- (id)init{
    self = [super init];
    if (self){
        
    }
    return self;
}

- (void)dealloc{
    [self cancelAllRequests];
}

/**
 TODO:获取Instance单例
 
 @return URHTTPRequest 实例对象
 
 @author pigpigdaddy
 @since
 */
+ (instancetype)shareInstance{
    static PPDHttpRequest *httpRequest;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        httpRequest = [[PPDHttpRequest alloc] init];
        [httpRequest initQueue];
    });
    return httpRequest;
}

/**
 TODO:初始化请求队列
 
 @author pigpigdaddy
 @since 3.0
 */
- (void)initQueue{
    self.queue = [[ASINetworkQueue alloc] init];
    [self.queue setShowAccurateProgress:YES];
    [self.queue setShouldCancelAllRequestsOnFailure:NO];
    [self.queue setMaxConcurrentOperationCount:30];
    [self.queue go];
}

/**
 TODO:取消所有请求
 
 @author pigpigdaddy
 @since 3.0
 */
- (void)cancelAllRequests{
    [self.queue cancelAllOperations];
}

/**
 TODO:http请求
 
 @param urlString   请求地址
 @param parameters  请求参数
 @param complection 完成block
 @param failure     失败block
 
 @author pigpigdaddy
 @since 3.0
 */
- (void)requestWithUrlString:(NSString *)urlString complection:(commonBlock)complection failure:(commonBlock)failure
{
    NSLog(@"---------------PPDHttpRequest    url:%@-----------",urlString);
    NSURL *url=[NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:url];
    [ASIHTTPRequest setDefaultTimeOutSeconds:60];
    [request setDelegate:self];
    [request setRequestMethod:@"GET"];
    [request setShouldAttemptPersistentConnection:NO];
    
    //添加信息对象
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    if (complection){
        [userInfo setObject:complection forKey:@"complectionBlock"];
    }
    if (failure){
        [userInfo setObject:failure forKey:@"failureBlock"];
    }
    [request setUserInfo:userInfo];
    
    [self.queue addOperation:request];
}

#pragma mark
#pragma mark ============ ASIHTTPRequestDelegate ============
- (void)requestStarted:(ASIHTTPRequest *)request{
    
}

- (void)requestFinished:(ASIHTTPRequest *)request{
    NSDictionary *userInfo = request.userInfo;
    commonBlock complection = [userInfo objectForKey:@"complectionBlock"];
    if (complection){
        complection(request.responseString);
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request{
    NSDictionary *userInfo = request.userInfo;
    commonBlock failure = [userInfo objectForKey:@"failureBlock"];
    if (failure){
        failure(request.responseString);
    }
}

@end
