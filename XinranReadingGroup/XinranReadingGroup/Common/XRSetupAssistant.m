//
//  XRSetupAssistant.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/16.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRSetupAssistant.h"
#import "XRShareAssistant.h"
#import <Bugtags/Bugtags.h>

@implementation XRSetupAssistant

+ (void)setup {
    [XRShareAssistant setup];
    [[self class] setupNavigationBar];
    [Bugtags startWithAppKey:@"cc612951d27832ef7a8af0f71b61a9b3" invocationEvent:BTGInvocationEventBubble];
}

+ (void)setupNavigationBar {
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_navigationbar"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

@end
