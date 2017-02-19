//
//  XRUserService.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/5.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZYCoreFramework/ZYBlockDefine.h>
#import "XRUserProfile.h"

/**
 *  获取用户的各种信息，捐的书啊借的书啊各种
 */
@interface XRUserService : NSObject

+ (void)fetchDonateRecord:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

+ (void)fetchShareBook:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

+ (void)fetchBorrowBook:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

+ (void)fetchActivity:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

+ (void)fetchUserProfile:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

+ (void)updateUserProfile:(XRUserProfile *)profile success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

+ (void)convertActivity:(NSString *)activityId success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;
@end
