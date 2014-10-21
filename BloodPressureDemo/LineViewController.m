//
//  LineViewController.m
//  BloodPressureDemo
//
//  Created by 林峰 on 14-10-21.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "LineViewController.h"

@interface LineViewController ()

@end

@implementation LineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLineView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)initLineView
{
    self.highLineView = [[BTSLineView alloc] initWithFrame:CGRectMake(10, 40, self.view.frame.size.width-20, 190)];
    self.highLineView.isInversionY = YES;
    self.highLineView.xLabel = @"日期";
    self.highLineView.yLabel = @"高压";
    [self.view addSubview:self.highLineView];
    
    self.lowLineView = [[BTSLineView alloc] initWithFrame:CGRectMake(10, 260, self.view.frame.size.width-20, 190)];
    self.lowLineView.isInversionY = YES;
    self.lowLineView.xLabel = @"日期";
    self.highLineView.yLabel = @"低压";
    [self.view addSubview:self.lowLineView];
}

@end
