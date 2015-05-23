//
//  XRBorrowResultViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/19.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBorrowResultViewController.h"
#import "XRBookService.h"
#import "XRBookEntity.h"

@implementation XRBorrowResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [XRBookService borrowBook:self.bookData.bookID success:^{
        //提示借阅成功
    } failure:^(NSError *error) {
        //提示借阅失败
    }];
}

@end
