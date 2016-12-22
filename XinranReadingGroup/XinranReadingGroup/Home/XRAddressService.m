//
//  XRAddressService.m
//  XinranReadingGroup
//
//  Created by dreamer on 2016/12/22.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRAddressService.h"
#import "XRNetwork+Token.h"

@implementation XRAddressService

+ (void)fetchAddressList:(void (^)(NSArray<NSDictionary *> *addressList))success failure:(void (^)(NSError *error))failure {
    [[XRNetwork sharedXRNetwork] GETWithToken:@"/book/address/query" param:nil success:^(id param) {
        if (success) {
            success(param[@"data"]);
        }
    } failure:failure];
}

@end
