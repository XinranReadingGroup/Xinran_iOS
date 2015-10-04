//
//  XRBorrowBookQRViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/4.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreDefine.h>
#import <BlocksKit/UIAlertView+BlocksKit.h>
#import "XRBorrowBookQRViewController.h"
#import "XRBookDetailEntity.h"
#import "XRBookEntity.h"
#import "XRBookRecordEntity.h"
#import "XRBorrowResultViewController.h"

@implementation XRBorrowBookQRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LOCALSTRING(@"借书");
}

- (void)scanBookSuccess:(XRBookDetailEntity *)bookData {
    [super scanBookSuccess:bookData];
    if (bookData && bookData.book.title && bookData.onOffStockRecord.borrowStatus == kBookStatusAvaliable) {
        NSString *message = [NSString stringWithFormat:@"确定要借《%@》啦？", bookData.book.title];
        UIAlertView *alertView = [UIAlertView bk_showAlertViewWithTitle:LOCALSTRING(@"借阅确认") message:LOCALSTRING(message) cancelButtonTitle:LOCALSTRING(@"取消") otherButtonTitles:@[LOCALSTRING(@"确定")] handler: ^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                //确定
                XRBorrowResultViewController *resultViewController = [[XRBorrowResultViewController alloc] init];
                resultViewController.bookData = bookData;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.navigationController pushViewController:resultViewController animated:YES];
                });
            }
            else {
                //取消的话继续扫描
                [self startReading];
            }
        }];
        [alertView show];
    }
    else if (!bookData || !bookData.book.bookID) {
        UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:LOCALSTRING(@"您扫描的书籍不在系统中")];
        [alertView bk_setCancelButtonWithTitle:LOCALSTRING(@"好") handler: ^{
            [self startReading];
        }];
        [alertView show];
    }
    else if (bookData.onOffStockRecord.borrowStatus != kBookStatusAvaliable) {
        UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:LOCALSTRING(@"啊哦这本书借不了哟")];
        [alertView bk_setCancelButtonWithTitle:LOCALSTRING(@"好") handler: ^{
            [self startReading];
        }];
        [alertView show];
    }
}


@end
