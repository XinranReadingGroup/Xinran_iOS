//
//  XRLoginBiz.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZYBlockDefine.h>

@interface XRLoginBiz : NSObject

+ (void)login:(NSString *)userName password:(NSString *)password success:(ZYBlock)success failure:(ZYErrorBlock)failure;

+ (void)registerUser:(NSString *)userName password:(NSString *)password success:(ZYBlock)success failure:(ZYErrorBlock)failure;

- (void)logout:(ZYBlock)success failure:(ZYBlock)failure;

@end
