//
// Created by dreamer on 15/11/26.
// Copyright (c) 2015 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/UIViewController+ZYCore.h>
#import "AppDelegate+XRSetup.h"
#import "XRTabbarController.h"
#import "XRUser.h"
#import "XRTools.h"


@implementation AppDelegate (XRSetup)

- (void)setupInitialViewController {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    if ([XRUser sharedXRUser].isLogin) {
        XRTabbarController *tabbarController = (XRTabbarController *)[UIViewController viewControllerWithIdentifer:
                NSStringFromClass([XRTabbarController class]) withStoryboardName:nil];
        self.window.rootViewController = tabbarController;
    }
    else {
        self.window.rootViewController = [XRTools loginViewController];
    }
}

@end