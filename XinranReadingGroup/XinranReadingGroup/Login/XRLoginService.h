//
//  XRLoginService.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/7.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZYBlockDefine.h>

@interface XRLoginService : NSObject

+ (void)login:(NSString *)userName password:(NSString *)password success:(ZYDictionaryBlock)success failure:(ZYErrorBlock)failure;

+ (void)logout:(NSString *)accessToken success:(ZYBlock)success failure:(ZYErrorBlock)failure;

+ (void)registerUser:(NSString *)userName password:(NSString *)password success:(ZYDictionaryBlock)success failure:(ZYErrorBlock)failure;

@end
