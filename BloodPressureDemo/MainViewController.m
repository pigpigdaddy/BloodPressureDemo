//
//  MainViewController.m
//  BloodPressureDemo
//
//  Created by 林峰 on 14-10-20.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "MainViewController.h"
#import "RoundLabelView.h"
#import "LineViewController.h"

@interface MainViewController ()

@property (nonatomic, strong)RoundLabelView *highView;
@property (nonatomic, strong)RoundLabelView *lowView;
@property (nonatomic, strong)LineViewController *lineViewController;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initView];
    [self initData];
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

- (IBAction)logOutAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)refreshAction:(id)sender {
    [self fetchData];
}
- (IBAction)historyData:(id)sender {
    self.buttonHistory.enabled = NO;
    [self presentViewController:self.lineViewController animated:YES completion:^{
        self.buttonHistory.enabled = YES;
    }];
}

- (void)fetchData
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(getData)]) {
        [self.delegate getData];
    }
}

- (void)initData
{
    [self fetchData];
}

- (void)setData:(NSMutableArray *)data
{
    _data = data;
    
    // 刷新
    [self.highView showValue:133];
    [self.lowView showValue:90];
}

- (void)initView
{
    self.highView = [[RoundLabelView alloc] initWithFrame:CGRectMake(80, 55, 160, 160)];
    self.highView.label.font = [UIFont systemFontOfSize:64];
    self.highView.label.textColor = [UIColor redColor];
    self.highView.labelMmHg.frame = CGRectMake(self.highView.label.frame.origin.x+self.highView.label.frame.size.width-80, self.highView.label.frame.origin.y+self.highView.label.frame.size.height-50, 60, 30);
    self.lowView.labelMmHg.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.highView];
    
    
    self.lowView = [[RoundLabelView alloc] initWithFrame:CGRectMake(100, 255, 120, 120)];
    self.lowView.label.font = [UIFont systemFontOfSize:38];
    self.lowView.label.textColor = [UIColor blueColor];
    self.lowView.labelMmHg.frame = CGRectMake(self.lowView.label.frame.origin.x+self.lowView.label.frame.size.width-60, self.lowView.label.frame.origin.y+self.lowView.label.frame.size.height-45, 60, 30);
    self.lowView.labelMmHg.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.lowView];
    
    self.lineViewController = [[LineViewController alloc] initWithNibName:@"LineViewController" bundle:nil];
}

@end
