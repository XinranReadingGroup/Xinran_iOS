//
//  XRBorrowRecordViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/11/23.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreDefine.h>
#import "XRBorrowRecordViewController.h"
#import "XRUserService.h"
#import "XRBookListEntity.h"
#import "ZYCoreCellInfo.h"
#import "XRBorrowRecordCell.h"
#import "UIViewController+navigationBarItem.h"
#import "XRBookDetailBaseViewController.h"
#import "UIViewController+ZYCore.h"
#import "SVProgressHUD.h"

@interface XRBorrowRecordViewController ()

@end

@implementation XRBorrowRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
    self.tableView.backgroundColor = RGBCOLOR(242,242,242);
}

- (void)fetchData {
    __weak typeof(self) weakSelf = self;
    [SVProgressHUD showWithStatus:nil];
    [XRUserService fetchBorrowBookWithPath:self.urlPath success:^(id param) {
        __strong typeof(self) self = weakSelf;
        [self setupTableViewData:param];
        NSArray *books = self.tableViewData.firstObject;
        [self.tableView reloadData];
        if (self.fetchDataSuccess) {
            self.fetchDataSuccess(books);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    } failure:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }];
}

- (void)setupTableViewData:(XRBookListEntity *)bookListEntity {
    NSMutableArray *sectionInfo = [NSMutableArray array];
    [bookListEntity.bookList enumerateObjectsUsingBlock:^(XRBookDetailEntity *obj, NSUInteger idx, BOOL *stop) {
        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRBorrowRecordCell class] withCellHeight:136 withCellData:obj withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
            XRBookDetailBaseViewController *detailViewController = (XRBookDetailBaseViewController *)[UIViewController viewControllerWithIdentifer:@"XRBookDetailBaseViewController" withStoryboardName:@"Main"];
            detailViewController.bookData = obj;
            [self.navigationController pushViewController:detailViewController animated:YES];
        }];
        cellInfo.doNotRegisterClass = YES;
        [sectionInfo addObject:cellInfo];
    }];
    self.tableViewData = @[[sectionInfo copy]];
}

@end
