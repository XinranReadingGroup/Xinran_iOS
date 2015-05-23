//
//  XRBookRecord.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/21.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookRecord.h"

@implementation XRBookRecord

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"bookID",
                                                       }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
