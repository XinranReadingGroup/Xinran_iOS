//
//  XRAddressEntity.h
//  XinranReadingGroup
//
//  Created by dreamer on 2016/12/22.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XREntity.h"

@interface XRAddressEntity : XREntity

@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *county;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSNumber *addressID;
@property (nonatomic, copy) NSNumber *lat;
@property (nonatomic, copy) NSNumber *lng;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *updatedAt;
@property (nonatomic, copy) NSNumber *userId;

@property (nonatomic, copy) NSString *addressTitle;

@end
