//
//  XRBookDetailLocationEntity.h
//  XinranReadingGroup
//
//  Created by Du on 03/03/2017.
//  Copyright © 2017 SnowWolf. All rights reserved.
//

#import "XREntity.h"

@interface XRBookDetailLocationEntity : XREntity

@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *county;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *locationString;

@end
