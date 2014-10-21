//
//  BTSBarView.h
//  AnimationPlot
//
//  Created by 億 俞 on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTSBarData.h"
#import <QuartzCore/QuartzCore.h>


@protocol BTSBarViewDelegate<NSObject>

@optional
//选中代理
-(void)selectedWithIndexPath:(NSIndexPath *)indexPath withRect:(CGRect)rect;

@end

@interface BTSBarView : UIView{
    
    NSMutableDictionary *_bars;
}
@property(nonatomic,strong) NSString *xLabel;
@property(nonatomic,strong) NSString *yLabel;
@property(nonatomic) CGFloat maxYValue;
@property(nonatomic,strong) NSMutableArray *barArray;
@property(nonatomic,strong) CALayer *contentLayer;
@property(nonatomic,assign) int barWidth;
@property(nonatomic,strong) UIScrollView *contentView;
@property(nonatomic,assign) id <BTSBarViewDelegate>delegate;

@end
