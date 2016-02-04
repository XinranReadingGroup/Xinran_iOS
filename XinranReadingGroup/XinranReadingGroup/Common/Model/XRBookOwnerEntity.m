//
//  XRBookOwnerEntity.m
//  XinranReadingGroup
//
//  Created by dreamer on 16/2/3.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRBookOwnerEntity.h"

@implementation XRBookOwnerEntity

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
            @"id" : @"userID"
    }];
}


@end
