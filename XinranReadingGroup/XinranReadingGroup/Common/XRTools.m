//
// Created by dreamer on 15/11/23.
// Copyright (c) 2015 SnowWolf. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>
#import "XRTools.h"
#import "UIViewController+ZYCore.h"
#import "XRLoginWelcomeViewController.h"


@implementation XRTools {

}
+ (void)popToTop {
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        UINavigationController *navigationController = ((UITabBarController *)viewController).selectedViewController;
        [navigationController popToRootViewControllerAnimated:YES];
    }
}

+ (void)showLoginViewController {
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    XRLoginWelcomeViewController *loginViewController = (XRLoginWelcomeViewController *)[UIViewController viewControllerWithIdentifer:
            NSStringFromClass([XRLoginWelcomeViewController class]) withStoryboardName:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [viewController presentViewController:navigationController animated:YES completion:nil];
}
@end