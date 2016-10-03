//
//  XRDonateResultViewController.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/28.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRResultBaseViewController.h"
#import "ZYCoreViewController.h"
#import "XRBookRecordEntity.h"

@class XRBookEntity;

@interface XRDonateResultViewController : ZYCoreViewController

@property (nonatomic, strong) NSString *ISBN;
@property (nonatomic) XRBookRecordEntity *donateBookDetail;
@property (nonatomic) BOOL success;//是否成功捐书

@end
