//
// Created by dreamer on 15/12/7.
// Copyright (c) 2015 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface XRUserProfile : MTLModel <MTLJSONSerializing>

@property (nonatomic) NSNumber *userId;
@property (nonatomic) NSString *nickName;
@property (nonatomic) NSString *imgId;
@property (nonatomic) NSNumber *lastSignInAt;
@property (nonatomic) NSString *area;
@property (nonatomic) NSString *signature;
@property (nonatomic) NSNumber *score;

+ (XRUserProfile *)userProfileWithUserID:(NSString *)userID;

+ (void)storeProfile:(XRUserProfile *)profile withUserID:(NSString *)userID;

+ (void)deleteProfileWithUserID:(NSString *)userID;

@end