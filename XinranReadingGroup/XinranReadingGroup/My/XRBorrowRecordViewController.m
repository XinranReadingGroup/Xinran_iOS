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

@interface XRBorrowRecordViewController ()

@property (weak, nonatomic) IBOutlet UILabel *bookSum;

@end

@implementation XRBorrowRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LOCALSTRING(@"我的借阅记录");
    [self setLeftBackItem];
    [self fetchData];
    self.tableView.backgroundColor = RGBCOLOR(242,242,242);
}

- (void)fetchData {
    [XRUserService fetchBorrowBook:^(id param) {
        [self setupTableViewData:param];
        NSArray *books = self.tableViewData.firstObject;
        self.bookSum.text = [NSString stringWithFormat:@"       您已借书%lu本",(unsigned long)books.count];
        [self.tableView reloadData];
    } failure:^(NSError *error) {

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
