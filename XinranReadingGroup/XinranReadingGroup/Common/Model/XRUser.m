//
//  XRUser.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/8.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRUser.h"
#import "XRUserProfile.h"
#import <ZYCoreDefine.h>
#import <SSKeychain.h>

static NSString * const USER_DEFAULTS_USER_NAME = @"username";
static NSString * const SERVER_NAME = @"XinranReading";

@implementation XRUser

@synthesize accessToken = _accessToken;
@synthesize userIdentifier = _userIdentifier;
@synthesize profile = _profile;

SYNTHESIZE_SINGLETON_FOR_CLASS(XRUser);

- (BOOL)isLogin {
    return self.accessToken ? YES : NO;
}

- (NSString *)userIdentifier {
    if (_userIdentifier) {
        return _userIdentifier;
    }
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
}

- (void)setUserIdentifier:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:USER_DEFAULTS_USER_NAME];
    _userIdentifier = userName;
}

- (void)setAccessToken:(NSString *)accessToken {
    NSError *error;
    [SSKeychain setPassword:accessToken forService:SERVER_NAME account:_userIdentifier error:&error];
    if (error) {
        DLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n保存access token时出错\n%@",error);
    }
    _accessToken = accessToken;
}

- (XRUserProfile *)profile {
    if (!_profile) {
        _profile = [XRUserProfile userProfileWithUserID:self.userIdentifier];
    }
    return _profile;
}

- (void)setProfile:(XRUserProfile *)profile {
    _profile = profile;
    [XRUserProfile storeProfile:profile withUserID:self.userIdentifier];
}

- (void)clearAccessToken {
    [SSKeychain deletePasswordForService:SERVER_NAME account:self.userIdentifier];
}

- (void)clearUserData {
    [self clearAccessToken];
    [XRUserProfile deleteProfileWithUserID:self.userIdentifier];
}

- (NSString *)accessToken {
    if (!_accessToken) {
        NSError *error;
        _accessToken = [SSKeychain passwordForService:SERVER_NAME account:self.userIdentifier error:&error];
        if (error) {
            DLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n读取access token时出错\n%@",error);
        }
    }
    return _accessToken;
}

- (void)signOut {
    [self clearUserData];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_USER_NAME];
}

@end
