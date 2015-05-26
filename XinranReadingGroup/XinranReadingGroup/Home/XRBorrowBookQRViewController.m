//
//  XRBorrowBookQRViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/17.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBorrowBookQRViewController.h"
#import <ZYCoreDefine.h>
#import <UIAlertView+BlocksKit.h>
#import "XRBookService.h"
#import "XRBookDetailEntity.h"
#import "XRBookEntity.h"
#import <NSString+ZYCore.h>
#import "XRBookRecordEntity.h"

@interface XRBorrowBookQRViewController ()

@end

@implementation XRBorrowBookQRViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)scanFinish:(NSString *)result {
	[XRBookService bookDetailWithBookID:[result toNumber] success: ^(id param) {
	    XRBookDetailEntity *bookEntity = param;
	    if (bookEntity && bookEntity.book.title && bookEntity.onOffStockRecord.borrowStatus == kBookStatusAvaliable) {
	        NSString *message = [NSString stringWithFormat:@"确定要借阅《%@》吗？", bookEntity.book.title];
	        UIAlertView *alertView = [UIAlertView bk_showAlertViewWithTitle:LOCALSTRING(@"借阅确认") message:LOCALSTRING(message) cancelButtonTitle:LOCALSTRING(@"取消") otherButtonTitles:@[LOCALSTRING(@"确定")] handler: ^(UIAlertView *alertView, NSInteger buttonIndex) {
	                if (buttonIndex == 1) {
	                    //确定
					}
	                else {
	                    //取消的话继续扫描
	                    [self startReading];
					}
				}];
	        [alertView show];
		}
	    else if (!bookEntity || !bookEntity.book.bookID) {
	        UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:LOCALSTRING(@"您扫描的书籍不在系统中")];
	        [alertView bk_setCancelButtonWithTitle:LOCALSTRING(@"好") handler: ^{
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
	} failure: ^(NSError *error) {
	    UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:LOCALSTRING(@"书籍信息获取失败")];
	    [alertView bk_setCancelButtonWithTitle:LOCALSTRING(@"好") handler: ^{
	            [self startReading];
			}];
	    [alertView show];
	}];
}

@end
