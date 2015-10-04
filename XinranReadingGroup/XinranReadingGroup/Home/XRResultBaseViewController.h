//
//  XRResultBaseViewController.h
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/21.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZYCoreViewController.h>

@class XRBookDetailEntity;

@interface XRResultBaseViewController : ZYCoreViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) XRBookDetailEntity *bookData;
@property (nonatomic, strong) NSString *resultText;
@property (nonatomic, strong) NSString *noticeText;

- (void)update;

@end
