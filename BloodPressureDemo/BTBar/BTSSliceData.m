//
//  BTSSliceData.m
//  AnimationPlot
//
//  Created by 億 俞 on 12-7-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BTSSliceData.h"

@implementation BTSSliceData
@synthesize value = _value;
@synthesize color = _color;
@synthesize title = _title;

+ (id)sliceDataWithValue:(int)value color:(UIColor *)color title:(NSString *)title
{
    BTSSliceData *data = [[[BTSSliceData alloc] init] autorelease];
    [data setValue:value];
    [data setColor:color];
    [data setTitle:title];
    return data;
}

-(void)dealloc{
    self.color=nil;
    self.title=nil;
    [super dealloc];
}
@end
