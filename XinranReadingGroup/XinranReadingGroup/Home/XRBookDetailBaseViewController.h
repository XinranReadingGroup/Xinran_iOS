//
//  XRBookDetailBaseViewController.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/6.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XRBookEntity;

@interface XRBookDetailBaseViewController : UITableViewController

@property (nonatomic, strong) XRBookEntity *bookData;

@end
