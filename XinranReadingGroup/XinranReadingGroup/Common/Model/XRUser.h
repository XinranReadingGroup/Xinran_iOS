//
//  XRUser.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/8.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XRUserProfile;

@interface XRUser : NSObject

@property (nonatomic) BOOL isLogin;
@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *userIdentifier;
@property (nonatomic) XRUserProfile *profile;

+ (XRUser *)sharedXRUser;

- (void)clearUserData;

- (void)signOut;
@end
