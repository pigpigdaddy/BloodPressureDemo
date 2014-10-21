//
//  BTSLineData.h
//  AnimationPlot
//
//  Created by 億 俞 on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface BTSLinePoint : NSObject
@property(nonatomic) CGFloat yValue;
@property(nonatomic) CGFloat yMaxValue;
@end

@interface BTSLineData : NSObject
@property(nonatomic,strong) NSMutableArray *pointArray;
@property(nonatomic,strong) NSMutableArray *xLabelArray;
@property(nonatomic,strong) UIColor *color;
@end
