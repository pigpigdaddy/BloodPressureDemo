//
//  RoundLabelView.h
//  BloodPressureDemo
//
//  Created by 林峰 on 14-10-21.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundLabelView : UIView

@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)UILabel *labelMmHg;
@property (nonatomic, assign)int labelValue;

- (void)showValue:(int)value;

@end
