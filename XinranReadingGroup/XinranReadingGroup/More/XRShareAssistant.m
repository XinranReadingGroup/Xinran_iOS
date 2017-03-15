//
//  XRShareAssistant.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/16.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRShareAssistant.h"
#import "UMSocial.h"
#import "UMFeedback.h"
#import <ZYCoreDefine.h>

static NSString * const UM_App_key = @"552fc463fd98c5ad320009dc";

@implementation XRShareAssistant

+ (void)setup {
    [UMSocialData setAppKey:UM_App_key];
    [UMFeedback setAppkey:UM_App_key];
}

- (void)showShareSheet:(UIViewController *)target {
    NSString *text = @"使用享阅借阅欣然读书吧藏书";
    UIImage *image = [UIImage imageNamed:@"AppIcon40x40"];
    NSURL *url = [NSURL URLWithString:@"http://www.xinrandushuba.com/"];
    UIActivityViewController *activity = [[UIActivityViewController alloc] initWithActivityItems:@[text, image, url] applicationActivities:nil];
    activity.excludedActivityTypes = @[UIActivityTypeAirDrop];
    
    [target presentViewController:activity animated:YES completion:NULL];
}

- (void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response {
    if (response.responseCode == UMSResponseCodeSuccess) {
        //分享成功
        DLog(@"社交分享成功");
    }
    else {
        //分享失败
        DLog(@"社交分享失败");
    }
}


@end
