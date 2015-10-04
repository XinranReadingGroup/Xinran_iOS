//
//  XRBookQRViewController.h
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/17.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRQRViewController.h"

@class XRBookDetailEntity;


@interface XRBookQRViewController : XRQRViewController

- (void)scanBookSuccess:(XRBookDetailEntity *)bookData;

@end
