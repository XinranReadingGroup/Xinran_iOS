//
// Created by dreamer on 15/12/7.
// Copyright (c) 2015 SnowWolf. All rights reserved.
//

#import "XRUserProfile.h"
#import "PINCache.h"


@implementation XRUserProfile {

}

- (NSString *)avatarUrl
{
    NSString *url = [NSString stringWithFormat:@"http://xinrandushuba.com/img/avatar/user_avatar_origin_%@.jpg", self.userId];
    return url;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"userId": @"id",
            @"score": @"score",
            @"nickName": @"nickName",
            @"imgId" : @"imgId",
            @"lastSignInAt": @"lastSignInAt",
            @"area": @"area",
            @"signature": @"signature"
    };
}


+ (XRUserProfile *)userProfileWithUserID:(NSString *)userID {
    return [[PINCache sharedCache] objectForKey:[[self class] keyForProfile:userID]];
}

+ (void)storeProfile:(XRUserProfile *)profile withUserID:(NSString *)userID {
    [[PINCache sharedCache] setObject:profile forKey:[[self class] keyForProfile:userID]];
}

+ (void)deleteProfileWithUserID:(NSString *)userID {
    [[PINCache sharedCache] removeObjectForKey:[[self class] keyForProfile:userID]];
}

+ (NSString *)keyForProfile:(NSString *)userID {
    return [NSString stringWithFormat:@"profile_%@",userID];
}

@end
