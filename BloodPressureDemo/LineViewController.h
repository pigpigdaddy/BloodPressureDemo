//
//  LineViewController.h
//  BloodPressureDemo
//
//  Created by 林峰 on 14-10-21.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTSLineData.h"
#import "BTSLineView.h"

@interface LineViewController : UIViewController

@property (nonatomic, strong)BTSLineView *highLineView;
@property (nonatomic, strong)BTSLineView *lowLineView;

@end
