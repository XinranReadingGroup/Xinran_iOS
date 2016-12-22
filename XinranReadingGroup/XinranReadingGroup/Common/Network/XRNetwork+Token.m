//
// Created by dreamer on 15/8/2.
// Copyright (c) 2015 SnowWolf. All rights reserved.
//

#import "XRNetwork+Token.h"
#import "XRLoginBiz.h"
#import "XRUser.h"


@implementation XRNetwork (Token)

- (void)GETWithToken:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [self GET:methodName param:[[self class] dictionaryWithToken:param] success:success failure:failure];
}

- (void)GETWithToken:(NSString *)methodName param:(NSDictionary *)param withEntityName:(NSString *)entityName success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [self GET:methodName param:[[self class] dictionaryWithToken:param] withEntityName:entityName success:success failure:failure];
}

- (void)POSTWithToken:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [self POST:methodName param:[[self class] dictionaryWithToken:param] success:success failure:failure];
}

+ (NSDictionary *)dictionaryWithToken:(NSDictionary *)dictionary {
    NSMutableDictionary *mutableParam = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    [mutableParam setValue:[XRUser sharedXRUser].accessToken forKey:@"accessToken"];
    return [NSDictionary dictionaryWithDictionary:mutableParam];
}

@end
