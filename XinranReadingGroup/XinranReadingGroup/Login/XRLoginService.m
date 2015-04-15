//
//  XRLoginService.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/7.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRLoginService.h"
#import "XRNetwork.h"

@implementation XRLoginService

+ (void)login:(NSString *)userName password:(NSString *)password success:(ZYDictionaryBlock)success failure:(ZYErrorBlock)failure {
    if (!password || !userName) {
        if (failure) {
            failure(nil);
        }
    }
    NSDictionary *param = @{@"userIdentifier":userName,@"password":password};
    [[XRNetwork sharedXRNetwork] GET:@"user/signIn" param:param success:^(id param) {
        if (success) {
            success(param);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)logout:(NSString *)accessToken success:(ZYBlock)success failure:(ZYErrorBlock)failure {
    if (!accessToken) {
        failure(nil);
    }
    [[XRNetwork sharedXRNetwork] GET:@"user/signOut" param:@{@"accessToken":accessToken} success:^(id param) {
        if (success) {
            success();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)registerUser:(NSString *)userName password:(NSString *)password success:(ZYDictionaryBlock)success failure:(ZYErrorBlock)failure {
    if (!password || !userName) {
        if (failure) {
            failure(nil);
        }
    }
    NSDictionary *param = @{@"userIdentifier":userName,@"password":password};
    [[XRNetwork sharedXRNetwork] GET:@"user/signUp" param:param success:^(id param) {
        if (success) {
            success(param);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
