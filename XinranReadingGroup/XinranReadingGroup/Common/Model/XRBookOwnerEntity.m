//
//  XRBookOwnerEntity.m
//  XinranReadingGroup
//
//  Created by dreamer on 16/2/3.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRBookOwnerEntity.h"
#import "XRNetwork.h"

@implementation XRBookOwnerEntity

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
            @"id" : @"userID",
    }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"avatarURL"]) {
        return YES;
    }
    return NO;
}

- (NSURL *)avatarURL {
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", [XRNetwork sharedXRNetwork].baseImageUrlString, self.imgId]];
}

@end
