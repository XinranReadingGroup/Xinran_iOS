//
//  XRBorrowResultViewController.h
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/19.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRResultBaseViewController.h"

@class XRBookDetailEntity;

/**
 *  借阅结果界面
 */
@interface XRBorrowResultViewController : XRResultBaseViewController

@property (nonatomic, copy) NSString *QRCode;               //扫到的二维码文本

@end
