//
//  XRBookDetailLocationEntity.m
//  XinranReadingGroup
//
//  Created by Du on 03/03/2017.
//  Copyright © 2017 SnowWolf. All rights reserved.
//

#import "XRBookDetailLocationEntity.h"

@implementation XRBookDetailLocationEntity

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

- (NSString *)locationString {
    NSMutableString *startString = [self.province?:@"" mutableCopy];
    if (self.county.length) {
        [startString appendFormat:@" %@", self.county];
    }
    if (self.city.length) {
        [startString appendFormat:@" %@", self.city];
    }
    if (self.detail.length) {
        [startString appendFormat:@" %@", self.detail];
    }
    return [startString copy];
}

@end
