//
//  XRNetwork.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/8.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZYBlockDefine.h>

@interface XRNetwork : NSObject

@property (nonatomic, strong) NSString *baseURL;

+ (XRNetwork *)sharedXRNetwork;

+ (XRNetwork *)sharedDoubanNetwork;

- (void)GET:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

- (void)POST:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

@end
