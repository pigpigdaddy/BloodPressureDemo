//
//  BTSBarView.m
//  AnimationPlot
//
//  Created by 億 俞 on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BTSBarView.h"
#import "BTSBarLayer.h"
#import "BTSBarSliceLayer.h"

@implementation BTSBarView
@synthesize xLabel;
@synthesize yLabel;
@synthesize maxYValue;
@synthesize barArray;
@synthesize contentLayer;
@synthesize barWidth;

-(void)initView
{
    _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(12, 0, self.bounds.size.width - 45, self.bounds.size.height)];
    _contentView.showsHorizontalScrollIndicator = NO;
    _contentView.showsVerticalScrollIndicator = NO;
    barWidth = 48;
    [self addSubview:_contentView];
    self.backgroundColor = [UIColor clearColor];
    _bars = [[NSMutableDictionary alloc] init];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initView];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initView];
    }
    return self;
}

- (void)dealloc
{
    [xLabel release];
    [yLabel release];
    [barArray release];
    self.contentLayer = nil;
    
    [_contentView release];
    _contentView = nil;
    [_bars release];
    _delegate = nil;
    [super dealloc];
}

-(void)setXLabel:(NSString *)theX{
    [xLabel release];
    xLabel = [theX retain];
    [self setNeedsDisplay];
}

-(void)setYLabel:(NSString *)theY{
    [yLabel release];
    yLabel = [theY retain];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:230.0/255.0 green:235.0/255.0 blue:243.0/255.0 alpha:1.0].CGColor);
    CGContextSetLineWidth(context, 5);
    CGContextSetLineCap(context, kCGLineCapRound);
    //CGContextSetShadowWithColor(context, CGSizeMake(-2, 2), 0.4, [UIColor lightGrayColor].CGColor);
    
    CGContextMoveToPoint(context, 10, 25);
    CGContextAddLineToPoint(context, 10, self.bounds.size.height-20);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 10, self.bounds.size.height-20);
    CGContextAddLineToPoint(context, self.bounds.size.width-35, self.bounds.size.height-20);
    CGContextStrokePath(context);
    
    [xLabel drawAtPoint:CGPointMake(self.bounds.size.width-30, self.bounds.size.height-20) withFont:[UIFont systemFontOfSize:12]];
    [yLabel drawAtPoint:CGPointMake(0, 0) withFont:[UIFont systemFontOfSize:12]];
}


-(void)setBarArray:(NSMutableArray*)theArray{
    if (!theArray || !theArray.count) {
        return;
    }
    //计算每个group的位置
    [barArray release];
    barArray = [theArray retain];
    
    for (UIView *subView in _contentView.subviews) {
        [subView removeFromSuperview];
    }
    [_bars removeAllObjects];
    
    UIView *content = [[UIView alloc]initWithFrame:CGRectMake(0, 19, self.bounds.size.width-45, self.bounds.size.height-42)];
    self.contentLayer = content.layer;
    //    content.layer.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.6].CGColor;
    [_contentView addSubview:content];
    [content release];
    
    CGFloat xIncrement = (self.bounds.size.width - 45) / barArray.count - barWidth;
    xIncrement = (xIncrement < 40)?40:xIncrement;
    
    CGFloat groupXoffset = xIncrement/2;
    NSLog(@"groupXoffset %f",groupXoffset);
    for (NSInteger i=0; i<barArray.count; i++) {
        BTSBarDataGroup *group = [barArray objectAtIndex:i];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(groupXoffset - xIncrement/2, _contentView.frame.size.height - 18,xIncrement + group.barArray.count*barWidth + (group.barArray.count-1) *10, 20)];
        label.backgroundColor = [UIColor clearColor];
        label.text = group.xLabel;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        
        [_contentView addSubview:label];
        [label release];
        
        
        CGFloat barXoffset = groupXoffset;
        for (int j = 0; j < group.barArray.count; j++) {
            BTSBarData *barData = [group.barArray objectAtIndex:j];
            barData.groupIndex = i;
            NSLog(@"x %f",barXoffset);
            [self insertBarSlice:barData x:barXoffset indexPath:[NSIndexPath indexPathForRow:i inSection:j]];
            
            barXoffset+=(barWidth + 10);
        }
        
        groupXoffset += group.barArray.count*barWidth+xIncrement;
        [_contentView setContentSize:CGSizeMake(barXoffset + barWidth, _contentView.frame.size.height)];
        CGRect frame = self.contentLayer.frame;
        frame.size.width = barXoffset + barWidth;
        if (frame.size.width < self.bounds.size.width - 45) {
            frame.size.width = self.bounds.size.width - 45;
        }
        self.contentLayer.frame = frame;
        
    }
    
}

-(void)insertBarSlice:(BTSBarData*)data x:(CGFloat)x indexPath:(NSIndexPath *)indexPath{
    BTSBarSliceLayer *barSliceLayer = [BTSBarSliceLayer layer];
    barSliceLayer.bounds = CGRectMake(0, 0, barWidth, self.bounds.size.height-95);
    barSliceLayer.backgroundColor = [UIColor clearColor].CGColor;
    barSliceLayer.barData = data;
    barSliceLayer.anchorPoint = CGPointMake(0, 1);
    barSliceLayer.contentsScale = [[UIScreen mainScreen]scale];
    //NSLog(@"x:%f",x);
    barSliceLayer.position = CGPointMake(x, self.bounds.size.height-42);
    [self.contentLayer addSublayer:barSliceLayer];
    
    
    
    CGFloat yOffset = (1-data.yValue/data.maxYValue)*barSliceLayer.bounds.size.height;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(x - 10 , yOffset+70 - 42, barWidth + 20, barSliceLayer.bounds.size.height-yOffset + 23 + 42);
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:btn];
    [_bars setObject:btn forKey:indexPath];
    
}

-(void)btnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    //转换坐标
//    CGRect frame = [btn convertRect:btn.frame toView:self];
    CGRect frame = btn.frame;
//    frame.origin.y += 42;
    frame.size.width += 65;
    
    
    NSArray *key = [_bars allKeysForObject:sender];
    NSLog(@"tap index %d, section %d",[[key objectAtIndex:0] row],[[key objectAtIndex:0] section]);
    if (_delegate && [_delegate respondsToSelector:@selector(selectedWithIndexPath:withRect:)]) {
        [_delegate selectedWithIndexPath:[key objectAtIndex:0] withRect:frame];
    }
}

@end
