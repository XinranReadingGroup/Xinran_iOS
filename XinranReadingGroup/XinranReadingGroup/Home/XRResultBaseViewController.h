//
//  XRResultBaseViewController.h
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/21.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XRBookEntity;

@interface XRResultBaseViewController : UIViewController

@property (nonatomic, strong) XRBookEntity *bookData;
@property (nonatomic, strong) NSString *resultText;
@property (nonatomic, strong) NSString *noticeText;

@end