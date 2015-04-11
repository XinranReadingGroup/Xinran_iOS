//
//  XRLoginBiz.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRLoginBiz.h"
#import "XRLoginService.h"
#import "XRUser.h"

@implementation XRLoginBiz

+ (void)login:(NSString *)userName password:(NSString *)password success:(ZYBlock)success failure:(ZYErrorBlock)failure {
    [XRLoginService login:userName password:password success:^(NSDictionary *dic) {
        [XRUser sharedXRUser].isLogin = YES;
        [XRUser sharedXRUser].userName = userName;
        [XRUser sharedXRUser].accessToken = [dic valueForKeyPath:@"data.accessToken"];
        if (success) {
            success();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)registerUser:(NSString *)userName password:(NSString *)password success:(ZYBlock)success failure:(ZYErrorBlock)failure {
    [XRLoginService registerUser:userName password:password success:^(NSDictionary *dic) {
        [XRUser sharedXRUser].isLogin = YES;
        [XRUser sharedXRUser].userName = userName;
        [XRUser sharedXRUser].accessToken = [dic valueForKeyPath:@"data.accessToken"];
        if (success) {
            success();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)logout:(ZYBlock)success failure:(ZYBlock)failure {
    [XRLoginService logout:[XRUser sharedXRUser].accessToken success:^{
        if (success) {
            success();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
