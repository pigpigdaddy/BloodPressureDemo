//
//  BTSBarSliceLayer.h
//  AnimationPlot
//
//  Created by 億 俞 on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BTSBarData.h"

typedef enum {
    BTSBarLayerSlices,
    BTSBarLayerLabels
} BTSBarLayerGroup;

@interface BTSBarSliceLayer : CALayer
@property(nonatomic,readwrite) CGFloat value;
@property(nonatomic,strong) BTSBarData *barData;
@end