//
//  XREditBookInfoViewController.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/9/29.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <ZYBlockDefine.h>
#import "XRCommonDefine.h"

@class XRBookEntity;

/**
 *  捐书时输入书籍信息的界面
 */
@interface XREditBookInfoViewController : UITableViewController

@property (nonatomic) XRBookEntity *bookData;
@property (nonatomic, copy) BookEntityBlock sumbitCallback;

@end
