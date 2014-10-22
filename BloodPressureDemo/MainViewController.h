//
//  MainViewController.h
//  BloodPressureDemo
//
//  Created by 林峰 on 14-10-20.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainViewControllerDelegate <NSObject>

// 获取数据
- (void)getData;

@end

@interface MainViewController : UIViewController

@property (nonatomic, assign)id<MainViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogOut;
@property (weak, nonatomic) IBOutlet UIButton *buttonRefresh;
@property (weak, nonatomic) IBOutlet UIButton *buttonHistory;
@property (nonatomic, strong)NSMutableArray *data;

- (void)fetchData;


@end
