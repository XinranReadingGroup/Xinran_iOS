//
//  XRBookEntity.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookEntity.h"

@implementation XRBookEntity

+ (JSONKeyMapper *)keyMapper {
	return [[JSONKeyMapper alloc] initWithDictionary:@{
	            @"id" : @"bookID",
			}];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
	return YES;
}

@end
