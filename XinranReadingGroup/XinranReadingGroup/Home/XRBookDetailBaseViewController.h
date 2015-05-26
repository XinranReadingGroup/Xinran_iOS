//
//  XRBookDetailBaseViewController.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/6.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XRBookDetailEntity;

@interface XRBookDetailBaseViewController : UIViewController

@property (nonatomic, strong) XRBookDetailEntity *bookData;
@property (weak, nonatomic) IBOutlet UIButton *borrowButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
