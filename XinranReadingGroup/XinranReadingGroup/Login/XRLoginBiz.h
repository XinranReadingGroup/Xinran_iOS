//
//  XRLoginBiz.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZYBlockDefine.h>

static NSString * const FETCH_USER_PROFILE_SUCCESS = @"fetch_user_profile_success";

@interface XRLoginBiz : NSObject

+ (void)login:(NSString *)userName password:(NSString *)password success:(ZYBlock)success failure:(ZYErrorBlock)failure;

+ (void)registerUser:(NSString *)userName password:(NSString *)password nickName:(NSString *)nickName success:(ZYBlock)success failure:(ZYErrorBlock)failure;

+ (void)logout:(ZYBlock)success failure:(ZYBlock)failure;

+ (void)refreshUserProfile:(ZYBlock)success;
@end
