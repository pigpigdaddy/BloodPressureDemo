//
//  MHNetWorkListenner.h
//  Tool
//
//  Created by Tr Li on 11-11-2.
//  Copyright (c) 2011年 imohoo. All rights reserved.
//  Version 1.0 基于 iOS 4.0
//  需要导入框架 SystemConfiguration.framework和Reachability类

#import <Foundation/Foundation.h>
#import "Reachability.h"

//应用程序需要实现此协议，当网络发生变化时候，与用户交互
@protocol MHNetWorkListennerDelegate <NSObject>

@optional
/* 
 * @Description 此回调只针对卡惠项目单独添加
 * 函数作用:当网络从无到有时，进入此回调
 * 函数参数:
 * 函数返回值:
 */

/* 
 * 函数作用:当网络发生改变 都会进入这个代理
 * 函数参数:网络状态
 * 函数返回值:
 * 修改于:20111102
 */
- (void)netWorkStatusWillChange:(NetworkStatus)status;

/* 
 * 函数作用:网络可以用时会进入这个代理 用处不大
 * 函数参数:
 * 函数返回值:
 * 修改于:20111102
 */ 
- (void)netWorkStatusWillEnabled;

/* 
 * 函数作用:wifi可用时触发
 * 函数参数: 
 * 函数返回值:
 * 修改于:20111102
 */ 
- (void)netWorkStatusWillEnabledViaWifi;

/* 
 * 函数作用:网络是3G or 2G时触发
 * 函数参数: 
 * 函数返回值:
 * 修改于:20111102
 */ 
- (void)netWorkStatusWillEnabledViaWWAN;

/* 
 * 函数作用:网络不可用时触发
 * 函数参数:网络状态
 * 函数返回值:
 * 修改于:20111102
 */ 
- (void)netWorkStatusWillDisconnection;

@end

//网络监听类当网络发生变化时，触发对应的协议
@interface MHNetWorkListenner : NSObject
{
@private
    
	Reachability    *rech;
	
	//标识网络是否活跃
	Boolean         _netWorkIsEnabled;
	
	// 设备链接网络的方式 
	NetworkStatus                   _witchNetWorkerEnabled;
	
	// 代理
	id<MHNetWorkListennerDelegate>  _delegate;
}
@property (nonatomic, assign) id<MHNetWorkListennerDelegate>  delegate;
//如果要使用下面两个属性，需要先调用startNetWorkeWatch 开启网络检测
@property (readonly, getter = witchNetWorkerEnabled) NetworkStatus  witchNetWorkerEnabled;
@property (readonly, getter = netWorkIsEnabled) Boolean             netWorkIsEnabled;

/* 
 * 函数作用:获取网络管理器
 * 函数参数:
 * 函数返回值:self
 * 修改于:20111102
 */ 
+ (id)sharedManager;

/* 
 * 函数作用:防止以其他方法创建第二实例 
 * 函数参数:
 * 函数返回值:self
 * 修改于:20111102
 */ 
+ (id)allocWithZone:(NSZone *)zone;

/* 
 * 函数作用:检测当前网络状态 
 * 函数参数: 
 * 函数返回值:当前网络状态
 * 修改于:20111102
 */ 
- (NetworkStatus)checkNowNetWorkStatus;

/* 
 * 函数作用:开始检测网络 
 * 函数参数:
 * 函数返回值:是否开启成功
 * 修改于:20111102
 */ 
- (Boolean)startNetWorkeWatch;

/* 
 * 函数作用:停止检测网络 
 * 函数参数:
 * 函数返回值:
 * 修改于:20111102
 */ 
- (void)stopNetWorkWatch;

@end

