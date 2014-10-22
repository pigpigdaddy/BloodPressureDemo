//
//  LineViewController.h
//  BloodPressureDemo
//
//  Created by 林峰 on 14-10-21.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHLineGraphView.h"

@interface LineViewController : UIViewController

@property (nonatomic, strong) SHLineGraphView *lineView;
@property (nonatomic, strong) NSMutableArray *yLabels;
@property (nonatomic, strong) NSMutableArray *xLabels;

@property (nonatomic, strong) NSMutableArray *data;

@end
