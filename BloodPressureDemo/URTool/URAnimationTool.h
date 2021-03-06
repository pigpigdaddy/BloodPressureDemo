//
//  URAnimationTool.h
//  Steward
//
//  Created by shen zhen on 13-5-5.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface URAnimationTool : NSObject

+ (void)animationWithScale:(UIView *)view
                      time:(float)time
                startScale:(float)startScale
                  endScale:(float)endScale
                  selector:(SEL)selector
                  delegate:(id)delegate;

/**   函数名称 animationWithAlpha
 **   函数作用 :改变view的明暗
 **   函数参数 :
 **   函数返回值:
 **/

+ (void)animationWithAlpha:(UIView *)view
                      time:(float)time
                startAlpha:(float)startAlpha
                  endAlpha:(float)endAlpha
                  selector:(SEL)selector
                  delegate:(id)delegate;

@end
