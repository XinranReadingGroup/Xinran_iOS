//
//  XRDonateResultViewController.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/28.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRResultBaseViewController.h"
#import "ZYCoreViewController.h"

@class XRBookEntity;

@interface XRDonateResultViewController : ZYCoreViewController

@property (nonatomic, strong) NSString *ISBN;
@property (nonatomic) XRBookEntity *bookData;

@end
