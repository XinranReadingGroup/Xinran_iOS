//
//  XRTabbarController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRTabbarController.h"
#import "XRUser.h"
#import "XRTools.h"

@interface XRTabbarController ()

@end

@implementation XRTabbarController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (![XRUser sharedXRUser].isLogin) {
        [self presentViewController:[XRTools loginViewController] animated:NO completion:nil];
    }
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"showLogin"] && [XRUser sharedXRUser].isLogin) {
        return NO;
    }
    return YES;
}

@end
