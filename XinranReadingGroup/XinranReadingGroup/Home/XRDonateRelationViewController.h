//
//  XRDonateRelationViewController.h
//  XinranReadingGroup
//
//  Created by peichuang on 16/10/3.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRBookQRViewController.h"
#import "XRBookEntity.h"

@class XRAddressEntity;

@interface XRDonateRelationViewController : XRBookQRViewController

@property (nonatomic) XRBookEntity *bookData;
@property (nonatomic, strong) XRAddressEntity *address;

@end
