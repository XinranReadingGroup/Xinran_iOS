//
//  XRBorrowRecordViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/11/23.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRBorrowRecordViewController.h"
#import "XRUserService.h"
#import "XRBookListEntity.h"
#import "ZYCoreCellInfo.h"
#import "XRBorrowRecordCell.h"
#import "SVProgressHUD.h"

@interface XRBorrowRecordViewController ()

@property (nonatomic) XRBookListEntity *bookList;

@end

@implementation XRBorrowRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
}

- (void)fetchData {
    [XRUserService fetchBorrowBook:^(id param) {
//        [self setupTableViewData:param];
        self.bookList = param;
        [self.tableView reloadData];
    } failure:^(NSError *error) {

    }];
}

//- (void)setupTableViewData:(XRBookListEntity *)bookListEntity {
//    NSMutableArray *sectionInfo = [NSMutableArray array];
//    [bookListEntity.bookList enumerateObjectsUsingBlock:^(XRBookDetailEntity *obj, NSUInteger idx, BOOL *stop) {
//        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRBorrowRecordCell class] withCellHeight:136 withCellData:obj withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
//            //TODO 跳转到详情
//        }];
//        cellInfo.doNotRegisterClass = YES;
//        [sectionInfo addObject:cellInfo];
//    }];
//    self.tableViewData = @[[sectionInfo copy]];
//    [self.tableView reloadData];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bookList.bookList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 136;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XRBorrowRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([XRBorrowRecordCell class]) forIndexPath:indexPath];
    cell.data = (id)self.bookList.bookList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
