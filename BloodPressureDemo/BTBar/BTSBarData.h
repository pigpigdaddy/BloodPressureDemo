//
//  BTSBarData.h
//  AnimationPlot
//
//  Created by 億 俞 on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface BTSBarDataGroup : NSObject
@property(nonatomic,strong) NSString *xLabel;
@property(nonatomic,strong) NSMutableArray *barArray;
@end

@interface BTSBarData : NSObject
@property(nonatomic,strong) UIColor *color;
@property(nonatomic) CGFloat yValue;
@property(nonatomic) CGFloat maxYValue;
@property(nonatomic) NSInteger groupIndex;
@end
