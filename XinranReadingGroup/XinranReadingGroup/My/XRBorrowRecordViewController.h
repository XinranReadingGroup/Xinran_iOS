//
//  XRBorrowRecordViewController.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/11/23.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZYCoreFramework/ZYCoreTableViewController.h>

@interface XRBorrowRecordViewController : ZYCoreTableViewController

@property (weak, nonatomic) IBOutlet UILabel *bookSum;

@property (nonatomic, strong) NSString *urlPath;
@property (nonatomic, copy) void (^fetchDataSuccess)(NSArray *books);

@end
