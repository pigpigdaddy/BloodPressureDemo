//
//  RoundLabelView.m
//  BloodPressureDemo
//
//  Created by 林峰 on 14-10-21.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "RoundLabelView.h"

@interface RoundLabelView()

@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, assign)int currentCount;
@property (nonatomic, assign)int value;

@end

@implementation RoundLabelView


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self initData];
        [self initView];
    }
    return self;
}

- (void)initData
{
    
}

- (void)initView
{
    CALayer *layer=[[CALayer alloc]init];
    layer.bounds=self.bounds;
    layer.position=CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    layer.backgroundColor=[UIColor clearColor].CGColor;
    layer.cornerRadius=self.bounds.size.height/2;;
    layer.masksToBounds=YES;
    layer.borderColor=[UIColor lightGrayColor].CGColor;
    layer.borderWidth=2.0;
    [self.layer addSublayer:layer];
    
    self.label = [[UILabel alloc] initWithFrame:self.bounds];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
    
    self.labelMmHg = [[UILabel alloc] init];
    self.labelMmHg.text = @"mmHg";
    self.labelMmHg.textColor = [UIColor darkGrayColor];
    [self addSubview:self.labelMmHg];
}

- (void)showValue:(int)value
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.value = value;
    self.currentCount = 0;
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(newThread) object:nil];
    [thread start];
}

- (void)newThread
{
    @autoreleasepool
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(addLabelValue) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] run];
    }
}

- (void)addLabelValue
{
    if (self.currentCount>=self.value) {
        [NSThread exit];
    }
    self.currentCount++;
    [self performSelectorOnMainThread:@selector(updateLabel) withObject:nil waitUntilDone:YES];
}

- (void)updateLabel
{
    self.label.text = [NSString stringWithFormat:@"%d", self.currentCount];
}

@end
