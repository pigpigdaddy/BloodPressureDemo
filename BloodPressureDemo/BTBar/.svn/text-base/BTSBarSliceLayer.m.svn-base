//
//  BTSBarSliceLayer.m
//  AnimationPlot
//
//  Created by 億 俞 on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#import "BTSBarSliceLayer.h"

#define kBarSliceValue @"value"
#define kBarGroupIndexKeyPath @"groupIndexKeyPath"

@interface BTSBarSliceDelegate : NSObject

@end

@implementation BTSBarSliceLayer
@synthesize value;
@synthesize barData;

- (void)dealloc
{
    if (self.delegate) {
        [self.delegate release];
    }
    self.delegate = nil;
    [barData release];
    [super dealloc];
}

-(void)setBarData:(BTSBarData *)theData{
    [barData release];
    barData = [theData retain];
    
    for (CALayer *sublayer in self.sublayers) {
        [sublayer removeFromSuperlayer];
    }
    
    //设置groupIndex，计算动画延迟
    [self setValue:[NSNumber numberWithInteger:barData.groupIndex] forKey:kBarGroupIndexKeyPath];
    
    if (!self.delegate) {
        self.delegate = [[BTSBarSliceDelegate alloc]init];
    }
    self.hidden = YES;
    CGFloat yOffset = (1-barData.yValue/barData.maxYValue)*self.bounds.size.height;
    CAGradientLayer *barLayer = [CAGradientLayer layer];
    barLayer.frame = CGRectMake(0, yOffset, 48, self.bounds.size.height-yOffset);
    barLayer.backgroundColor = barData.color.CGColor;
//    barLayer.colors = [NSArray arrayWithObjects:(id)barData.color.CGColor,(id)[UIColor whiteColor].CGColor, nil];
    barLayer.startPoint = CGPointMake(0, 0);
    barLayer.endPoint = CGPointMake(1.5, 0.1);
    barLayer.shadowColor = [UIColor blackColor].CGColor;
    barLayer.shadowOpacity = 0.5;
    barLayer.contentsScale = [[UIScreen mainScreen]scale];
    barLayer.shadowOffset = CGSizeMake(2, 0);
    [self addSublayer:barLayer];
    
    CALayer *Poplayer=[CALayer layer];
    Poplayer.frame=CGRectMake(-12, yOffset - 45, 72, 39);
    Poplayer.contentsScale=[[UIScreen mainScreen] scale];
    UIImage *PopImage = [UIImage imageNamed:@"barChart_pop.png"];
    CGImageRef image=PopImage.CGImage;
    Poplayer.contents=(id)image;
    
    [self addSublayer:Poplayer];
    
    
    CATextLayer *barLabelLayer = [CATextLayer layer];
//    barLabelLayer.backgroundColor = [[UIColor redColor] CGColor];
    barLabelLayer.string = [NSString stringWithFormat:@"%.0f",barData.yValue];
    barLabelLayer.foregroundColor = [UIColor colorWithRed:73.0/255.0 green:94.0/255.0 blue:111.0/255.0 alpha:1.0f].CGColor;
    barLabelLayer.alignmentMode = kCAAlignmentCenter;
    barLabelLayer.contentsScale = [[UIScreen mainScreen]scale];
    barLabelLayer.font = @"MicrosoftYaHei";
    barLabelLayer.fontSize = 14;
    barLabelLayer.frame = CGRectMake(0, yOffset-37, 48, 20);
    [self addSublayer:barLabelLayer];
}
@end


@implementation BTSBarSliceDelegate
- (id <CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event
{
    //NSLog(@"event:%@",event);
    if ([event isEqualToString:@"onOrderIn"]) {
        CABasicAnimation *growAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
        growAnimation.duration = 0.5;
        growAnimation.delegate = self;
        growAnimation.beginTime = CACurrentMediaTime()+0.5*[[layer valueForKey:kBarGroupIndexKeyPath]integerValue];
        growAnimation.fromValue = [NSNumber numberWithFloat:0];
        growAnimation.toValue = [NSNumber numberWithFloat:1];
        [growAnimation setValue:layer forKey:@"layer"];
        return growAnimation;
    } else {
        return nil;
    }
}

- (void)animationDidStart:(CAAnimation *)anin{
    CALayer *layer = [anin valueForKey:@"layer"];
    layer.hidden = NO;
}
@end