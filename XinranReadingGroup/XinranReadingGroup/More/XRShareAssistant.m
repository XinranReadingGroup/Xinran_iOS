//
//  XRShareAssistant.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/16.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRShareAssistant.h"
#import "UMSocial.h"
#import <ZYCoreDefine.h>

static NSString * const UM_App_key = @"552fc463fd98c5ad320009dc";

@implementation XRShareAssistant

+ (void)setup {
    [UMSocialData setAppKey:UM_App_key];
}

- (void)showShareSheet:(UIViewController *)target {
    [UMSocialSnsService presentSnsIconSheetView:target appKey:UM_App_key shareText:LOCALSTRING(@"享阅分享测试") shareImage:nil shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToEmail,UMShareToSms,UMShareToQzone] delegate:self];
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
