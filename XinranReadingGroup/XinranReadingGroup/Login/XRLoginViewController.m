//
//  XRLoginViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/4/7.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRLoginViewController.h"
#import "XRLoginBiz.h"
#import <ZYCoreDefine.h>
#import <UIViewController+ZYCore.h>
#import <NSString+ZYCore.h>
#import <ZYCoreHintAssistant.h>

@interface XRLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation XRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  点击登录按钮
 *
 *  @param sender 登录按钮
 */
- (IBAction)loginButtonTapped:(UIButton *)sender {
    if ([[self.userName.text trim] isEmpty]) {
        [ZYCoreHintAssistant showAlertViewWithTitle:LOCALSTRING(@"请填写用户名")];
        return;
    }
    if ([[self.password.text trim] isEmpty]) {
        [ZYCoreHintAssistant showAlertViewWithTitle:LOCALSTRING(@"请填写密码")];
        return;
    }
    
    self.loginButton.enabled = NO;
    NSString *userNameStr = self.userName.text;
    NSString *passwordStr = self.password.text;
    [XRLoginBiz login:userNameStr password:passwordStr success:^{
        self.loginButton.enabled = YES;
        //跳转到主页
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view endEditing:YES];
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        });
    } failure:^(NSError *error) {
        self.loginButton.enabled = YES;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
