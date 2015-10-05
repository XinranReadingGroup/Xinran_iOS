//
//  XRMyViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/5.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRMyViewController.h"
#import "XRMyProfileCell.h"
#import "UIButton+XRButton.h"
#import "XRUser.h"
#import <ZYCoreCellInfo.h>
#import <ZYTitleCell.h>
#import <ZYCoreFramework/ZYCoreDefine.h>
#import <Masonry/View+MASAdditions.h>

@implementation XRMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LOCALSTRING(@"我的");
    self.tableView.tableFooterView = [self footerView];
    [self setupData];
}

- (void)setupData {
    //用户信息
    ZYCoreCellInfo *userInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRMyProfileCell class] withCellHeight:80. withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
        //TODO 点击头像
    }];
    userInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    //section 2
    NSArray *cellTitles = @[@"我的捐书记录",@"我的借阅记录",@"我的共享记录",@"我的公益积分"];
    NSMutableArray *section2 = [NSMutableArray array];
    [cellTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *cellData = @{@"title":obj};
        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[ZYTitleCell class] withCellHeight:[ZYTitleCell cellHeight] withCellData:cellData withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
            //TODO 界面跳转
        }];
        cellInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [section2 addObject:cellInfo];
    }];

    self.tableViewData = @[@[userInfo],section2];
}

//退出登录按钮
- (UIView *)footerView {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    UIButton *signOut = [UIButton redRoundedRectButtonWithTitle:LOCALSTRING(@"退出登录")];
    [footerView addSubview:signOut];
    __weak UIButton *weakSignOut = signOut;
    [signOut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(footerView);
        make.size.mas_equalTo(signOut.frame.size);
    }];
    [signOut addTarget:self action:@selector(signOutTapped) forControlEvents:UIControlEventTouchUpInside];
    return footerView;
}

- (void)signOutTapped {
    //TODO 退出登录之后界面要刷新
    [[XRUser sharedXRUser] signOut];
}

@end
