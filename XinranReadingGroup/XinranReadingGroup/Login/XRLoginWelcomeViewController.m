//
//  XRLoginWelcomeViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/4/7.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRLoginWelcomeViewController.h"
#import "XRUser.h"
#import <UIViewController+ZYCore.h>

@interface XRLoginWelcomeViewController ()

@end

@implementation XRLoginWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationController setNavigationBarHidden:YES];
    [XRUser sharedXRUser].userIdentifier = @"123";
    [XRUser sharedXRUser].accessToken = @"aaaa";
    if ([XRUser sharedXRUser].isLogin) {
        //如果登录就直接跳过登录界面
        [self presentViewControllerWithStoryboardName:@"Main" viewController:@"XRTabbarController" animation:NO completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
