//
//  XRBorrowedBookDetaiViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/17.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBorrowedBookDetaiViewController.h"
#import <ZYCoreDefine.h>
#import <UIControl+BlocksKit.h>
#import <UIView+ZYCore.h>

@implementation XRBorrowedBookDetaiViewController

- (id)init {
    if (self = (XRBorrowedBookDetaiViewController *)[super init]) {
//        [self addBorrowButton];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self addBorrowButton];
}

- (void)addBorrowButton {
    UIImage *borrowButtonImage = [UIImage imageNamed:@"detail_borrow_normal"];
    UIButton *borrowButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, borrowButtonImage.size.width, borrowButtonImage.size.height)];
    [borrowButton setBackgroundImage:borrowButtonImage forState:UIControlStateNormal];
    [borrowButton setBackgroundImage:[UIImage imageNamed:@"detail_borrow_selected"] forState:UIControlStateHighlighted];
    [borrowButton setBackgroundImage:[UIImage imageNamed:@"detail_borrow_selected"] forState:UIControlStateSelected];
    [borrowButton setTitle:LOCALSTRING(@"扫码借书") forState:UIControlStateNormal];
    [borrowButton bk_addEventHandler:^(id sender) {
        //TODO 借书按钮按下
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:borrowButton];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, borrowButton.height, 0);
}

@end
