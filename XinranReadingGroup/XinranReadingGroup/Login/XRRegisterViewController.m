//
//  XRRegisterViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/4/7.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRRegisterViewController.h"
#import "XRLoginBiz.h"
#import <ZYCoreDefine.h>
#import <UIViewController+ZYCore.h>
#import <ZYCoreHintAssistant.h>
#import "XRUser.h"

@interface XRRegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UITextField *nickName;

@end

@implementation XRRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerButtonTapped:(UIButton *)sender {
    if (![self.password.text isEqualToString:self.confirmPassword.text]) {
        [ZYCoreHintAssistant showAlertViewWithTitle:LOCALSTRING(@"确认密码的内容与密码不一致哟")];
        return;
    }
    self.registerButton.enabled = NO;
    [XRLoginBiz registerUser:self.userName.text password:self.password.text nickName:self.nickName.text success:^{
        //跳到主页
        self.registerButton.enabled = YES;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewControllerWithStoryboardName:@"Main" viewController:@"XRTabbarController" animation:NO completion:^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.navigationController popToRootViewControllerAnimated:NO];
                });
            }];
        });
    } failure:^(NSError *error) {
        DLog(@"注册失败，失败原因：%@",error.description);
        self.registerButton.enabled = YES;
        dispatch_async(dispatch_get_main_queue(), ^{
            [ZYCoreHintAssistant showAlertViewWithTitle:LOCALSTRING(@"注册失败啦")];
        });
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
