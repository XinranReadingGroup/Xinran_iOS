//
//  XRAddressService.h
//  XinranReadingGroup
//
//  Created by dreamer on 2016/12/22.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XRAddressService : NSObject

+ (void)fetchAddressList:(void (^)(NSArray<NSDictionary *> *addressList))success failure:(void (^)(NSError *error))failure;

@end
