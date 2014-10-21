//
//  BTSBarData.m
//  AnimationPlot
//
//  Created by 億 俞 on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BTSBarData.h"

@implementation BTSBarDataGroup
@synthesize barArray;
@synthesize xLabel;
- (void)dealloc
{
    [barArray release];
    [xLabel release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        barArray = [[NSMutableArray alloc]init];
    }
    return self;
}
@end

@implementation BTSBarData
@synthesize color;
@synthesize yValue;
@synthesize maxYValue;
@synthesize groupIndex;

- (void)dealloc
{
    [color release];
    [super dealloc];
}
@end
