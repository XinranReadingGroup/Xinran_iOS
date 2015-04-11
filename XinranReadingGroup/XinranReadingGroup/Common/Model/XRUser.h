//
//  XRUser.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/8.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZYCoreDefine.h>


@interface XRUser : NSObject

@property (nonatomic) BOOL isLogin;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *accessToken;

+ (XRUser *)sharedXRUser;

@end
