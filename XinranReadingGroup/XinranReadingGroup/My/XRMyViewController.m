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
#import "XRBookCollectionViewController.h"
#import "XRDonateBookCollectionViewController.h"
#import "XRLoginViewController.h"
#import <ZYCoreCellInfo.h>
#import <ZYTitleCell.h>
#import <ZYCoreFramework/ZYCoreDefine.h>
#import <Masonry/View+MASAdditions.h>
#import <ZYCoreFramework/UIViewController+ZYCore.h>

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
    NSArray *jumpViewControllers = @[[XRDonateBookCollectionViewController class],[XRBookCollectionViewController class],[XRBookCollectionViewController class],[XRBookCollectionViewController class]];
    NSMutableArray *section2 = [NSMutableArray array];
    [cellTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *cellData = @{@"title":obj};
        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[ZYTitleCell class] withCellHeight:[ZYTitleCell cellHeight] withCellData:cellData withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
            //TODO 界面跳转
            Class aClass = jumpViewControllers[idx];
            dispatch_async(dispatch_get_main_queue(),^{
//                [self pushToViewControllerWithStoryboardName:@"Main" viewController:NSStringFromClass(aClass)];
                UIViewController *viewController = [aClass new];
                viewController.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:viewController animated:YES];
            });
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
        make.width.equalTo(footerView).multipliedBy(0.7);
        make.height.mas_equalTo(weakSignOut.frame.size.height);
    }];
    [signOut addTarget:self action:@selector(signOutTapped) forControlEvents:UIControlEventTouchUpInside];
    return footerView;
}

- (void)signOutTapped {
    [[XRUser sharedXRUser] signOut];
    [self.tabBarController dismissViewControllerAnimated:NO completion:nil];
}

@end
