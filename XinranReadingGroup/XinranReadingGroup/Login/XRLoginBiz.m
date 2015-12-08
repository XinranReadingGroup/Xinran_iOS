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
#import "XRUserService.h"
#import "MTLModel.h"
#import "XRUserProfile.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

@implementation XRLoginBiz

+ (void)login:(NSString *)userName password:(NSString *)password success:(ZYBlock)success failure:(ZYErrorBlock)failure {
	[XRLoginService login:userName password:password success: ^(NSDictionary *dic) {
	    if (!dic || !dic[@"data"] || ![dic[@"data"] isKindOfClass:[NSDictionary class]] || !dic[@"data"][@"accessToken"]) {
	        failure(nil);
	        return;
		}
	    [XRUser sharedXRUser].userIdentifier = userName;
	    [XRUser sharedXRUser].accessToken = [dic valueForKeyPath:@"data.accessToken"];
		//获取用户信息
		[[self class] refreshUserProfile:^{
        }];
		if (success) {
	        success();
		}
	} failure: ^(NSError *error) {
	    if (failure) {
	        failure(error);
		}
	}];
}

+ (void)registerUser:(NSString *)userName password:(NSString *)password nickName:(NSString *)nickName success:(ZYBlock)success failure:(ZYErrorBlock)failure {
	[XRLoginService registerUser:userName password:password nickName:(NSString *)nickName success: ^(NSDictionary *dic) {
	    [XRUser sharedXRUser].isLogin = YES;
	    [[XRUser sharedXRUser] setUserIdentifier:userName];
        [[XRUser sharedXRUser] setAccessToken:[dic valueForKeyPath:@"data.accessToken"]];
        if (success) {
	        success();
		}
	} failure: ^(NSError *error) {
	    if (failure) {
	        failure(error);
		}
	}];
}

+ (void)logout:(ZYBlock)success failure:(ZYBlock)failure {
	[XRLoginService logout:[XRUser sharedXRUser].accessToken success: ^{
	    [XRUser sharedXRUser].isLogin = NO;
	    [XRUser sharedXRUser].userIdentifier = nil;
	    [XRUser sharedXRUser].accessToken = nil;
	    if (success) {
	        success();
		}
	} failure: ^(NSError *error) {
	    if (failure) {
	        failure(error);
		}
	}];
}

+ (void)refreshUserProfile:(ZYBlock)success {
	[XRUserService fetchUserProfile:^(id param) {
		NSError *error;
		XRUserProfile *userProfile = [MTLJSONAdapter modelOfClass:[XRUserProfile class] fromJSONDictionary:param error:&error];
		if (!error) {
			[XRUser sharedXRUser].profile = userProfile;
		}
        [[NSNotificationCenter defaultCenter] postNotificationName:FETCH_USER_PROFILE_SUCCESS object:nil];
		DDLogDebug(@"更新用户信息成功");
        if (success) {
            success();
        }
	} failure:^(NSError *error) {
		DDLogDebug(@"获取用户信息失败");
	}];
}

@end
