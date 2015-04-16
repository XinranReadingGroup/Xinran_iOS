//
//  XRUser.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/8.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRUser.h"
#import <ZYCoreDefine.h>
#import <SSKeychain.h>

@implementation XRUser

@synthesize accessToken = _accessToken;
@synthesize userIdentifier = _userIdentifier;

SYNTHESIZE_SINGLETON_FOR_CLASS(XRUser);

- (BOOL)isLogin {
    _isLogin = self.accessToken ? YES : NO;
    return _isLogin;
}

- (NSString *)userIdentifier {
    if (_userIdentifier) {
        return _userIdentifier;
    }
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
}

- (void)setUserIdentifier:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"username"];
    _userIdentifier = userName;
}

- (void)setAccessToken:(NSString *)accessToken {
    [SSKeychain setPassword:accessToken forService:@"XinranReading" account:_userIdentifier];
    _accessToken = accessToken;
}

- (NSString *)accessToken {
    if (!_accessToken) {
        _accessToken = [SSKeychain passwordForService:@"XinranReading" account:_userIdentifier];
    }
    return _accessToken;
}

@end
