//
//  MHNetWorkListenner.m
//  Tool
//
//  Created by Tr Li on 11-11-2.
//  Copyright (c) 2011年 imohoo. All rights reserved.
//

#import "MHNetWorkListenner.h"

//测试网络的网址
#define NET_HOST @"www.yahoo.com"

#pragma mark NetWorkManagerPrivateMethod

@interface MHNetWorkListenner(private)

/**
 * 当网络发生变化时 处理网络判断
 */
- (void)reachabilityChanged:(NSNotification *)note; 

@end

@implementation MHNetWorkListenner
@synthesize delegate = _delegate;
@synthesize witchNetWorkerEnabled = _witchNetWorkerEnabled;
@synthesize netWorkIsEnabled = _netWorkIsEnabled;

static MHNetWorkListenner *_defaultLintenner = nil;

/* 
 * 函数作用:获取网络管理器
 * 函数参数:
 * 函数返回值:self
 * 修改于:20111102
 */ 
+ (id)sharedManager
{
    if (!_defaultLintenner)
	{
		_defaultLintenner = [[self alloc] init];
	}
	return _defaultLintenner;
}

/* 
 * 函数作用:防止以其他方法创建第二实例 
 * 函数参数:
 * 函数返回值:self
 * 修改于:20111102
 */ 
+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
	{
		if (_defaultLintenner == nil)
		{ 
			_defaultLintenner = [super allocWithZone:zone];
			return _defaultLintenner;
		}
	}
	return nil;
}

/* 
 * 函数作用:检测当前网络状态 
 * 函数参数: 
 * 函数返回值:当前网络状态
 * 修改于:20111102
 */ 
- (NetworkStatus)checkNowNetWorkStatus
{
    Reachability *reach = [Reachability reachabilityWithHostName:NET_HOST];
	return [reach currentReachabilityStatus];
}

/* 
 * 函数作用:开始检测网络 
 * 函数参数:
 * 函数返回值:是否开启成功
 * 修改于:20111102
 */ 
- (Boolean)startNetWorkeWatch
{
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(reachabilityChanged:)
												 name: kReachabilityChangedNotification
											   object: nil];
	rech = [[Reachability reachabilityWithHostName:NET_HOST] retain];
	Boolean finish = [rech startNotifier];
	return finish;
}

/* 
 * 函数作用:停止检测网络 
 * 函数参数:
 * 函数返回值:
 * 修改于:20111102
 */ 
- (void)stopNetWorkWatch
{
    [rech stopNotifier];
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[_defaultLintenner release];
	_defaultLintenner = nil;
}

- (void)reachabilityChanged:(NSNotification *)note 
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
	NetworkStatus status = [curReach currentReachabilityStatus];
    
	//当网络发生变化 都会出发这个代理
    if (_delegate && [(NSObject*)_delegate respondsToSelector:@selector(netWorkStatusWillChange:)])
    {
        [_delegate netWorkStatusWillChange:status];
    } 
	
	switch (status)
	{
		case NotReachable:
		{
			//网络不可达
			_netWorkIsEnabled = NO;
			_witchNetWorkerEnabled = NotReachable;
			
			if (_delegate && [(NSObject*)_delegate respondsToSelector:@selector(netWorkStatusWillDisconnection)])
			{
				[_delegate netWorkStatusWillDisconnection];
			}
		}
            break;
		case ReachableViaWiFi:
		{
			//网络可达
            if (self.delegate && [self.delegate respondsToSelector:@selector(netWorkStatusWillEnabled)] && !_netWorkIsEnabled) {
                [self.delegate netWorkStatusWillEnabled];
            }
			_netWorkIsEnabled = YES;
			_witchNetWorkerEnabled = ReachableViaWiFi;
			
			if (_delegate && [(NSObject*)_delegate respondsToSelector:@selector(netWorkStatusWillEnabledViaWifi)])
			{
				[_delegate netWorkStatusWillEnabledViaWifi];
			}
		}
            break;
		case ReachableViaWWAN:
		{
			//网络可达
            if (self.delegate && [self.delegate respondsToSelector:@selector(netWorkStatusWillEnabled)] && !_netWorkIsEnabled) {
                [self.delegate netWorkStatusWillEnabled];
            }
			_netWorkIsEnabled = YES;
			_witchNetWorkerEnabled = ReachableViaWWAN;
			
			if (_delegate && [(NSObject*)_delegate respondsToSelector:@selector(netWorkStatusWillEnabledViaWWAN)])
			{
				[_delegate netWorkStatusWillEnabledViaWWAN];
			}
		}
            break;
		default:
			break;
	}
}

- (void)dealloc 
{
    if (_defaultLintenner)
	{
		[_defaultLintenner release];
	}
	if (_delegate)
	{
		_delegate = nil;
	}
    
    [super dealloc];
}

@end
