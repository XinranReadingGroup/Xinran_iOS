//
//  XRActivityEntity.m
//  XinranReadingGroup
//
//  Created by peichuang on 17/2/19.
//  Copyright © 2017年 SnowWolf. All rights reserved.
//

#import "XRActivityEntity.h"

@implementation XRActivityEntity

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"activityId"
                                                       }];
}

@end
