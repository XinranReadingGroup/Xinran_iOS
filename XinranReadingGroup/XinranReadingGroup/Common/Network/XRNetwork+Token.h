//
// Created by dreamer on 15/8/2.
// Copyright (c) 2015 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XRNetwork.h"
#import "ZYBlockDefine.h"

@interface XRNetwork (Token)


- (void)POSTWithToken:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;
@end