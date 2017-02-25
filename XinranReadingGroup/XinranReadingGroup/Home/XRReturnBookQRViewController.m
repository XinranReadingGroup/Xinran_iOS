//
//  XRReturnBookQRViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/4.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRReturnBookQRViewController.h"
#import <ZYCoreFramework/ZYCoreDefine.h>
#import <BlocksKit/UIAlertView+BlocksKit.h>
#import "XRBookDetailEntity.h"
#import "XRBookEntity.h"
#import "XRBookRecordEntity.h"
#import "XRReturnBookResultViewController.h"

@implementation XRReturnBookQRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LOCALSTRING(@"还书");
}


- (void)scanBookSuccess:(XRBookDetailEntity *)bookData QRCode:(NSString *)QRCode {
    [super scanBookSuccess:bookData QRCode:QRCode];
    if (bookData && bookData.book.title && bookData.onOffStockRecord.borrowStatus == kBookStatusBorrowed) {
        NSString *message = [NSString stringWithFormat:@"确定归还《%@》？", bookData.book.title];
        UIAlertView *alertView = [UIAlertView bk_showAlertViewWithTitle:LOCALSTRING(@"归还确认") message:LOCALSTRING(message) cancelButtonTitle:LOCALSTRING(@"取消") otherButtonTitles:@[LOCALSTRING(@"确定")] handler: ^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                //确定
                XRReturnBookResultViewController *resultViewController = [[XRReturnBookResultViewController alloc] init];
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
    else if (bookData.onOffStockRecord.borrowStatus != kBookStatusBorrowed) {
        UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:LOCALSTRING(@"啊哦这本书好像还不了哟")];
        [alertView bk_setCancelButtonWithTitle:LOCALSTRING(@"好") handler: ^{
            [self startReading];
        }];
        [alertView show];
    }
}

@end
