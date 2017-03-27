//
//  XRNetwork.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/8.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZYBlockDefine.h>

static NSString * const KEY_NETWORK_ERROR_MESSAGE = @"key_network_error_mesage";

@interface XRNetwork : NSObject

@property (nonatomic, strong) NSString *baseURL;

@property (nonatomic, copy) NSString *baseImageUrlString;

+ (XRNetwork *)sharedXRNetwork;

+ (XRNetwork *)sharedDoubanNetwork;

- (void)GET:(NSString *)methodName param:(NSDictionary *)param withEntityName:(NSString *)entityName success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

- (void)GET:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

- (void)POST:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

- (void)POST:(NSString *)methodName param:(NSDictionary *)param data:(NSData *)data success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;
@end
