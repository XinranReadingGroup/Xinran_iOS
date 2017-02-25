//
// Created by dreamer on 15/11/25.
// Copyright (c) 2015 SnowWolf. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>
#import <ZYCoreFramework/ZYCoreDefine.h>
#import "XRNetworkErrorAssistant.h"
#import "XRTools.h"
#import "XRUserService.h"
#import "XRUser.h"
#import "XRNetwork.h"

@implementation XRNetworkErrorAssistant {

}

+ (void)handleErrorFromServer:(id)responseObject {
    NSInteger errorCode = [[responseObject valueForKey:@"code"] integerValue];
    if (errorCode == 403) {
        //token失效
        [SVProgressHUD showErrorWithStatus:LOCALSTRING(@"您的登录失效啦,请重新登录")];
        [[XRUser sharedXRUser] signOut];
        [XRTools popToTop];
        [XRTools showLoginViewController];
    }
    else {
        NSString *errorMessage = LOCALSTRING(@"请求错误请重试");
        if ([responseObject isKindOfClass:[NSError class]]) {
            NSError *error = responseObject;
            errorMessage = error.userInfo[KEY_NETWORK_ERROR_MESSAGE];
        } else if ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject valueForKey:@"data"] && [[responseObject valueForKey:@"data"] isKindOfClass:[NSString class]]) {
            errorMessage = [responseObject valueForKey:@"data"];
        }
        
        [SVProgressHUD showErrorWithStatus:errorMessage];
    }
}

+ (void)handleNetworkFailure:(NSError *)error {
    [SVProgressHUD showErrorWithStatus:error.description];
}

@end
