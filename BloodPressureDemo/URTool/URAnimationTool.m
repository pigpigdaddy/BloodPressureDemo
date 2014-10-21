//
//  URAnimationTool.m
//  Steward
//
//  Created by shen zhen on 13-5-5.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import "URAnimationTool.h"

@implementation URAnimationTool

/**   函数名称 animationWithScale
 **   函数作用 :改变view的大小 动画
 **   函数参数 :
 **   函数返回值:
 **/

+ (void)animationWithScale:(UIView *)view
                      time:(float)time
                startScale:(float)startScale
                  endScale:(float)endScale
                  selector:(SEL)selector
                  delegate:(id)delegate
{
    view.transform = CGAffineTransformMakeScale(startScale, startScale);
    
    [UIView beginAnimations:@"animationWithScale" context:nil];
    [UIView setAnimationDuration:time];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationRepeatAutoreverses:NO];
    if (delegate)
    {
		[UIView setAnimationDelegate:delegate];
		[UIView setAnimationDidStopSelector:selector];
	}
    
    view.transform = CGAffineTransformMakeScale(endScale, endScale);  
    
    [UIView commitAnimations];
}

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
                  delegate:(id)delegate
{
    view.alpha = startAlpha;
    
    [UIView beginAnimations:@"animationWithAlpha" context:nil];
    [UIView setAnimationDuration:time];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationRepeatAutoreverses:NO];
    if (delegate)
    {
		[UIView setAnimationDelegate:delegate];
		[UIView setAnimationDidStopSelector:selector];
	}
    
    view.alpha=endAlpha;
    
    [UIView commitAnimations];
}

@end
