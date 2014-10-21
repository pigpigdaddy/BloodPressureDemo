//
//  BTSLineData.m
//  AnimationPlot
//
//  Created by 億 俞 on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BTSLineData.h"

@implementation BTSLinePoint
@synthesize yValue;
@synthesize yMaxValue;
@end

@implementation BTSLineData
@synthesize pointArray;
@synthesize xLabelArray;
@synthesize color;
- (id)init
{
    self = [super init];
    if (self) {
        pointArray = [[NSMutableArray alloc]init];
        xLabelArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)dealloc
{
    [pointArray release];
    [xLabelArray release];
    [color release];
    [super dealloc];
}
@end
