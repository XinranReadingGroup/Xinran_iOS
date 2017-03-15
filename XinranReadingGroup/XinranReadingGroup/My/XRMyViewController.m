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
#import "XRShareBookCollectionViewController.h"
#import "XRBorrowRecordViewController.h"
#import "XRProfileViewController.h"
#import "UIViewController+ZYCore.h"
#import "XRMemberPointViewController.h"
#import "XRTools.h"
#import <ZYCoreCellInfo.h>
#import <ZYTitleCell.h>
#import <ZYCoreFramework/ZYCoreDefine.h>
#import <Masonry/View+MASAdditions.h>
#import "XRLoginBiz.h"

@implementation XRMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LOCALSTRING(@"我的");
    self.tableView.tableFooterView = [self footerView];
    [self setupData];
    [[NSNotificationCenter defaultCenter] addObserver:self.tableView selector:@selector(reloadData) name:FETCH_USER_PROFILE_SUCCESS object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)setupData {
    //用户信息
    ZYCoreCellInfo *userInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRMyProfileCell class] withCellHeight:80. withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
        //TODO 点击头像
        XRProfileViewController *profileController = [XRProfileViewController new];
        profileController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:profileController animated:YES];
    }];
    userInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    //section 2
    NSArray *cellTitles = @[@"捐书记录",@"正在借阅", @"还书记录",@"共享记录",@"公益积分"];
    NSMutableArray *section2 = [NSMutableArray array];
    [cellTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *cellData = @{@"title":obj};
        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[ZYTitleCell class] withCellHeight:[ZYTitleCell cellHeight] withCellData:cellData withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
            UIViewController *viewController = nil;
            if (idx == 0) {
                viewController = [XRDonateBookCollectionViewController new];
            } else if (idx == 1) {
                XRBorrowRecordViewController *recordViewController = (XRBorrowRecordViewController *)[UIViewController viewControllerWithIdentifer:NSStringFromClass([XRBorrowRecordViewController class]) withStoryboardName:@"Main"];
                recordViewController.urlPath = @"book/borrow/records";
                recordViewController.title = LOCALSTRING(@"您的借阅记录");
                __weak typeof(recordViewController) weakRecord = recordViewController;
                [recordViewController setFetchDataSuccess:^(NSArray *books) {
                    weakRecord.bookSum.text = [NSString stringWithFormat:@"       您已借书%lu本",(unsigned long)books.count];
                }];
                viewController = recordViewController;
            } else if (idx == 2) {
                XRBorrowRecordViewController *recordViewController = (XRBorrowRecordViewController *)[UIViewController viewControllerWithIdentifer:NSStringFromClass([XRBorrowRecordViewController class]) withStoryboardName:@"Main"];
                recordViewController.urlPath = @"book/return/records";
                recordViewController.title = LOCALSTRING(@"您的还书记录");
                __weak typeof(recordViewController) weakRecord = recordViewController;
                [recordViewController setFetchDataSuccess:^(NSArray *books) {
                    weakRecord.bookSum.text = [NSString stringWithFormat:@"       您借过%lu本书",(unsigned long)books.count];
                }];
                viewController = recordViewController;
            } else if (idx == 3) {
                viewController = [XRShareBookCollectionViewController new];
            } else if (idx == 4) {
                viewController = [UIViewController viewControllerWithIdentifer:NSStringFromClass([XRMemberPointViewController class]) withStoryboardName:@"Main"];
            }
            if (viewController) {
                viewController.hidesBottomBarWhenPushed = YES;
                dispatch_async(dispatch_get_main_queue(),^{
                    [self.navigationController pushViewController:viewController animated:YES];
                });
            }
            
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
    [XRTools showLoginViewController];
}

@end
