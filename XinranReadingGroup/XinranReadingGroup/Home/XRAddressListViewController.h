//
//  XRAddressListViewController.h
//  XinranReadingGroup
//
//  Created by dreamer on 2016/12/22.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreTableViewController.h>

@class XRAddressEntity;

/**
 地址列表
 */
@interface XRAddressListViewController : ZYCoreTableViewController

@property (nonatomic, copy) void(^addressTappedCallback)(XRAddressEntity *address);

@end
