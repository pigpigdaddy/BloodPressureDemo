//
//  BTSLineView.h
//  AnimationPlot
//
//  Created by 億 俞 on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTSBarData.h"
#import "BTSLineData.h"


@interface BTSLineView : UIView{
    UIScrollView *_contentView;
    
}
@property(nonatomic,strong) NSMutableArray *lineArray;
@property(nonatomic,strong) NSString *xLabel;
@property(nonatomic,strong) NSString *yLabel;
@property(nonatomic) CGFloat maxYValue;
@property(nonatomic, assign) BOOL isInversionY;
@property(nonatomic, assign) BOOL showRedLine;
-(void)insertLineSlice:(BTSLineData*)data x:(CGFloat)x;
@end
