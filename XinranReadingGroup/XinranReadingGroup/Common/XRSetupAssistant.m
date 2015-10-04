//
//  XRSetupAssistant.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/16.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRSetupAssistant.h"
#import "XRShareAssistant.h"

@implementation XRSetupAssistant

+ (void)setup {
    [XRShareAssistant setup];
    [[self class] setupNavigationBar];
}

+ (void)setupNavigationBar {
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_navigationbar"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

@end
