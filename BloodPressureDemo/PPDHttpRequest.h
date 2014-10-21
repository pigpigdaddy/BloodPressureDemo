//
//  PPDHttpRequest.h
//  HttpRequestUsingBlockDemo
//
//  Created by pigpigdaddy on 14-9-4.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义通用的block
typedef void(^commonBlock)(id arg);

@interface PPDHttpRequest : NSObject

/**
 TODO:获取Instance单例
 
 @return URHTTPRequest 实例对象
 
 @author pigpigdaddy
 @since
 */
+ (instancetype)shareInstance;

/**
 TODO:http请求
 
 @param urlString   请求地址
 @param parameters  请求参数
 @param complection 完成block
 @param failure     失败block
 
 @author pigpigdaddy
 @since 3.0
 */
- (void)requestWithUrlString:(NSString *)urlString complection:(commonBlock)complection failure:(commonBlock)failure;

/**
 TODO:取消所有请求
 
 @author pigpigdaddy
 @since 3.0
 */
- (void)cancelAllRequests;

@end
