//
//  XRAddressListViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 2016/12/22.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRAddressListViewController.h"
#import <ZYCoreFramework/ZYCoreCellInfo.h>
#import <ZYCoreFramework/ZYTitleCell.h>
#import <ZYCoreFramework/ZYCoreDefine.h>
#import "XRAddressService.h"
#import "XRNetworkErrorAssistant.h"
#import "XRAddressEntity.h"

@interface XRAddressListViewController ()

@end

@implementation XRAddressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LOCALSTRING(@"选择地址");
    self.tableView.tableFooterView = [UIView new];
    [self fetchData];
}

- (void)fetchData {
    __weak typeof(self) weakSelf = self;
    [XRAddressService fetchAddressList:^(NSArray<NSDictionary *> *addressList) {
        [weakSelf reloadWithAddressList:addressList];
    } failure:^(NSError *error) {
        [XRNetworkErrorAssistant handleNetworkFailure: error];
    }];
}

- (void)reloadWithAddressList:(NSArray <NSDictionary *> *)addressList {
    NSMutableArray *cellInfos = [NSMutableArray array];
    __weak typeof(self) weakSelf = self;
    [addressList enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSError *error;
        XRAddressEntity *addressEntity = [[XRAddressEntity alloc] initWithDictionary:obj error:&error];
        if (!error) {
            ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[ZYTitleCell class] withCellHeight:[ZYTitleCell cellHeight] withCellData:@{@"title": addressEntity.addressTitle} withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
                if (weakSelf.addressTappedCallback) {
                    weakSelf.addressTappedCallback(addressEntity);
                }
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }];
            [cellInfos addObject:cellInfo];
        }
    }];
    self.tableViewData = @[[cellInfos copy]];
}

@end
