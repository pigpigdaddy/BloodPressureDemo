//
//  ViewController.m
//  BloodPressureDemo
//
//  Created by 林峰 on 14-10-20.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "PPDHttpRequest.h"
#import "JSON.h"

#define USER_NAME_TEST_ONE @"wangfei"
#define USER_NAME_TEST_TWO @"smallhead"

#define USER_PASSWORD_TEST @"888888"


@interface ViewController ()<UITextFieldDelegate, MainViewControllerDelegate>

@property (nonatomic, strong)NSString *userName;

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;

@property (nonatomic, strong)MainViewController *mainViewController;

@end

@implementation ViewController
#pragma mark
#pragma mark ============life circle============
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData
{
    
}

- (void)initView
{
    self.mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.mainViewController.delegate = self;
}

- (IBAction)loginButtonAction:(id)sender {
    [self login];
}

- (void)login
{
    if (![self.textFieldName.text isEqualToString:@""]) {
        [self.textFieldName resignFirstResponder];
        [self showMainViewController];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
//    if ([self.textFieldName.text isEqualToString:USER_NAME_TEST_ONE] || [self.textFieldName.text isEqualToString:USER_NAME_TEST_TWO]) {
//        if ([self.textFieldPassword.text isEqualToString:USER_PASSWORD_TEST]) {
//            // 成功登录
//            [self.textFieldName resignFirstResponder];
//            [self.textFieldPassword resignFirstResponder];
//            [self showMainViewController];
//        }else{
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名或密码错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [alertView show];
//        }
//    }else{
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名或密码错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alertView show];
//    }
}

- (void)showMainViewController
{
    self.buttonLogin.enabled = NO;
    [self presentViewController:self.mainViewController animated:YES completion:^{
        self.buttonLogin.enabled = YES;
        [self.mainViewController fetchData];
    }];
}

#pragma mark
#pragma mark ============ 数据获取 ============

#pragma mark
#pragma mark ============ UITextFieldDelegate ============
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.textFieldName) {
        [self.textFieldName resignFirstResponder];
        [self login];
//        [self.textFieldPassword becomeFirstResponder];
    }else if (textField == self.textFieldPassword){
        [self login];
    }
    
    return YES;
}

#pragma mark
#pragma mark ============ MainViewControllerDelegate ============

// 获取数据
- (void)getData
{
    NSString *url = [NSString stringWithFormat:@"http://122.96.49.28/%@.php?username=", self.textFieldName.text];
    
    [[PPDHttpRequest shareInstance] requestWithUrlString:url complection:^(id arg) {
        //
        NSLog(@"%@", arg);
        id object = [arg JSONValue];
        if (object && [object isKindOfClass:[NSArray class]]) {
            //
            self.mainViewController.data = [NSMutableArray arrayWithArray:(NSArray *)object];
        }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"服务器数据出错" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
        }
    } failure:^(id arg) {
        //
        NSLog(@"%@", arg);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"服务器请求失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }];
}


@end
