//
//  LineViewController.m
//  BloodPressureDemo
//
//  Created by 林峰 on 14-10-21.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "LineViewController.h"
#import "SHPlot.h"

@interface LineViewController ()

@end

@implementation LineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskLandscapeRight);
}

- (void)initView
{
    
}

- (void)initData
{

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
    //initate the graph view
    self.lineView = [[SHLineGraphView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width-20, 260)];
    
    NSDictionary *_themeAttributes = @{
                                       kXAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kXAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                                       kYAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kYAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                                       kYAxisLabelSideMarginsKey : @20,
                                       kPlotBackgroundLineColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kDotSizeKey : @10
                                       };
    self.lineView.themeAttributes = _themeAttributes;
    
    self.lineView.yAxisRange = @(200);
    
    self.lineView.yAxisSuffix = @"mmHg";
    
    [self.view addSubview:self.lineView];
}

- (void)setData:(NSMutableArray *)data
{
    _data = data;
    
    if (!self.lineView) {
        [self initLineView];
    }
    
    NSMutableArray *arrayYLabel = [NSMutableArray array];
    NSMutableArray *highArray = [NSMutableArray array];
    NSMutableArray *lowArray = [NSMutableArray array];
    NSMutableArray *heartArray = [NSMutableArray array];
    
    for (int i = 0; i<_data.count; i++) {
        NSDictionary *dict = (NSDictionary *)[_data objectAtIndex:i];
        
        NSDictionary *yLabelDict = [NSDictionary dictionaryWithObject:[dict objectForKey:@"date"] forKey:[NSNumber numberWithInt:i]];
        [arrayYLabel addObject:yLabelDict];
        
        NSDictionary *highDict = [NSDictionary dictionaryWithObject:[dict objectForKey:@"high"] forKey:[NSNumber numberWithInt:i]];
        [highArray addObject:highDict];
        
        NSDictionary *lowDict = [NSDictionary dictionaryWithObject:[dict objectForKey:@"low"] forKey:[NSNumber numberWithInt:i]];
        [lowArray addObject:lowDict];
        
        NSDictionary *heartDict = [NSDictionary dictionaryWithObject:[dict objectForKey:@"low"] forKey:[NSNumber numberWithInt:i]];
        [heartArray addObject:heartDict];
    }
    
    self.lineView.xAxisValues = arrayYLabel;
    
    
    SHPlot *_plot1 = [[SHPlot alloc] init];
    
    _plot1.plottingValues = highArray;
    
    NSArray *arr = @[@"1", @"2", @"3", @"4", @"5", @"6" , @"7" , @"8", @"9", @"10", @"11", @"12"];
    _plot1.plottingPointsLabels = arr;
    
    
    NSDictionary *_plotThemeAttributes = @{
                                           kPlotFillColorKey : [UIColor clearColor],
                                           kPlotStrokeWidthKey : @2,
                                           kPlotStrokeColorKey : [UIColor redColor],
                                           kPlotPointFillColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                                           kPlotPointValueFontKey : [UIFont systemFontOfSize:18]
                                           };
    
    _plot1.plotThemeAttributes = _plotThemeAttributes;
    [self.lineView addPlot:_plot1];
    
    
    SHPlot *_plot2 = [[SHPlot alloc] init];
    
    _plot2.plottingValues = lowArray;
    
    NSArray *arr2 = @[@"1", @"2", @"3", @"4", @"5", @"6" , @"7" , @"8", @"9", @"10", @"11", @"12"];
    _plot2.plottingPointsLabels = arr2;
    
    
    NSDictionary *_plotThemeAttributes2 = @{
                                           kPlotFillColorKey : [UIColor clearColor],
                                           kPlotStrokeWidthKey : @2,
                                           kPlotStrokeColorKey : [UIColor blueColor],
                                           kPlotPointFillColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                                           kPlotPointValueFontKey : [UIFont systemFontOfSize:18]
                                           };
    
    _plot2.plotThemeAttributes = _plotThemeAttributes2;
    [self.lineView addPlot:_plot2];
    
    
//    SHPlot *_plot3 = [[SHPlot alloc] init];
//    
//    _plot3.plottingValues = heartArray;
//    
//    NSArray *arr3 = @[@"1", @"2", @"3", @"4", @"5", @"6" , @"7" , @"8", @"9", @"10", @"11", @"12"];
//    _plot3.plottingPointsLabels = arr3;
//    
//    
//    NSDictionary *_plotThemeAttributes3 = @{
//                                           kPlotFillColorKey : [UIColor clearColor],
//                                           kPlotStrokeWidthKey : @2,
//                                           kPlotStrokeColorKey : [UIColor greenColor],
//                                           kPlotPointFillColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
//                                           kPlotPointValueFontKey : [UIFont systemFontOfSize:18]
//                                           };
//    
//    _plot3.plotThemeAttributes = _plotThemeAttributes3;
//    [self.lineView addPlot:_plot3];

    [self.lineView setupTheView];
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [self.lineView removeFromSuperview];
        self.lineView = nil;
    }];
}

@end
