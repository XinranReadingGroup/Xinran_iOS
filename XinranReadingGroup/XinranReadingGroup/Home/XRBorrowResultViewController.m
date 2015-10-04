//
//  XRBorrowResultViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/19.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBorrowResultViewController.h"
#import "XRBookService.h"
#import "XRBookDetailEntity.h"
#import "XRBookEntity.h"
#import "XRBookRecordEntity.h"
#import "SVProgressHUD.h"
#import <ZYCoreDefine.h>

@implementation XRBorrowResultViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[SVProgressHUD showWithStatus:LOCALSTRING(@"书籍借阅中，稍安勿躁哟")];
	[XRBookService borrowBook:self.bookData.onOffStockRecord.bookID success: ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
	    //借书成功
	    self.resultText = LOCALSTRING(@"借阅成功");
	    self.noticeText = LOCALSTRING(@"请在30天内归还哦");
	    [self update];
	} failure: ^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
	    //借书失败
	    self.resultText = LOCALSTRING(@"借阅失败");
	    self.noticeText = LOCALSTRING(@"返回重试一下吧");
	    [self update];
	}];
}

@end
