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
#import "XRTools.h"
#import "NSString+ZYCore.h"
#import "XRAboutViewController.h"
#import "SVProgressHUD.h"

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
    NSString *userName = [self.userName.text trim];
    if ([self.password.text trim].length == 0) {
        [ZYCoreHintAssistant showAlertViewWithTitle:LOCALSTRING(@"请输入密码")];
        return;
    }
    if (![self.password.text isEqualToString:self.confirmPassword.text]) {
        [ZYCoreHintAssistant showAlertViewWithTitle:LOCALSTRING(@"确认密码的内容与密码不一致哟")];
        return;
    }
    
    NSString *emailRegular = @".*@.*\..*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegular];
    if (![predicate evaluateWithObject:userName]) {
        //用户名不合法
        [ZYCoreHintAssistant showAlertViewWithTitle:LOCALSTRING(@"用户名不合法，请填入正确的电子邮箱")];
        return;
    }
    self.registerButton.enabled = NO;
    [XRLoginBiz registerUser:self.userName.text password:self.password.text nickName:self.nickName.text success:^{
        //跳到主页
        self.registerButton.enabled = YES;
        [SVProgressHUD showWithStatus:LOCALSTRING(@"注册成功~")];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view endEditing:YES];
            [XRTools showTabbarViewController:self animated:NO];
        });
    } failure:^(NSError *error) {
        DLog(@"注册失败，失败原因：%@",error.description);
        self.registerButton.enabled = YES;
        dispatch_async(dispatch_get_main_queue(), ^{
            [ZYCoreHintAssistant showAlertViewWithTitle:LOCALSTRING(@"注册失败啦")];
        });
    }];
}

- (IBAction)registerAgreementTapped:(id)sender {
    NSString *registerFileUrl = [[NSBundle mainBundle] pathForResource:@"register" ofType:@"txt"];
    if (registerFileUrl) {
        NSError *error;
        NSString *registerText = [NSString stringWithContentsOfFile:registerFileUrl encoding:NSUTF8StringEncoding error:&error];
        XRAboutViewController *textViewController = (XRAboutViewController *)[XRAboutViewController viewControllerWithIdentifer:@"XRAboutViewController" withStoryboardName:@"Main"];
        textViewController.title = LOCALSTRING(@"注册协议");
        textViewController.text = registerText;
        [self.navigationController pushViewController:textViewController animated:YES];
    }
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
