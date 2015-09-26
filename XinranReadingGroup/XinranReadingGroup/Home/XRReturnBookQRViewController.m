//
// Created by dreamer on 15/8/4.
// Copyright (c) 2015 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreDefine.h>
#import <ZYCoreFramework/ZYCoreHintAssistant.h>
#import "XRReturnBookQRViewController.h"
#import "XRBookService.h"
#import "NSString+ZYCore.h"
#import "XRBookDetailEntity.h"
#import "XRBookEntity.h"
#import "XRBookRecordEntity.h"
#import "XRReturnBookResultViewController.h"
#import <BlocksKit/UIAlertView+BlocksKit.h>

@implementation XRReturnBookQRViewController {

}

- (void)scanFinish:(NSString *)result {
    [super scanFinish:result];
    [XRBookService bookDetailWithBookID:[result toNumber] success:^(id param) {
        XRBookDetailEntity *bookEntity = param;
        if (bookEntity && bookEntity.book.title && bookEntity.onOffStockRecord.borrowStatus == kBookStatusAvaliable) {
            NSString *message = [NSString stringWithFormat:@"确定要借阅《%@》吗？", bookEntity.book.title];
            UIAlertView *alertView = [UIAlertView bk_showAlertViewWithTitle:LOCALSTRING(@"借阅确认") message:LOCALSTRING(message) cancelButtonTitle:LOCALSTRING(@"取消") otherButtonTitles:@[LOCALSTRING(@"确定")] handler: ^(UIAlertView *alertView, NSInteger buttonIndex) {
                if (buttonIndex == 1) {
                    //确定
                    XRReturnBookResultViewController *resultViewController = [[XRReturnBookResultViewController alloc] init];
                    resultViewController.bookData = bookEntity;
                    [self.navigationController pushViewController:resultViewController animated:YES];
                }
                [self startReading];
            }];
            [alertView show];
        }
        else if (!bookEntity || !bookEntity.book.bookID) {
            UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:LOCALSTRING(@"您扫描的书籍不在系统中")];
            [alertView bk_setCancelButtonWithTitle:LOCALSTRING(@
            "好") handler: ^{
                [self startReading];
            }];
            [alertView show];
        }
        else if (bookEntity.onOffStockRecord.borrowStatus != kBookStatusAvaliable) {
            UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:LOCALSTRING(@"这本书已被借走")];
            [alertView bk_setCancelButtonWithTitle:LOCALSTRING(@"好") handler: ^{
                [self startReading];
            }];
            [alertView show];
        }
        [self startReading];
    } failure:^(NSError *error) {
        [ZYCoreHintAssistant showAlertViewWithTitle:LOCALSTRING(@"")];
    }];
}


@end