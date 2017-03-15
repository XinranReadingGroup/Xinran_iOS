//
//  XRAddressEntity.m
//  XinranReadingGroup
//
//  Created by dreamer on 2016/12/22.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRAddressEntity.h"

@implementation XRAddressEntity

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"addressID"}];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

- (NSString *)addressTitle {
    return [NSString stringWithFormat:@"%@ %@ %@ %@", self.province, self.city, self.county, self.detail];
}

@end
