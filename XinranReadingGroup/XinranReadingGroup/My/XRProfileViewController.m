//
//  XRProfileViewController.m
//  XinranReadingGroup
//
//  Created by peichuang on 16/10/6.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRProfileViewController.h"
#import "ZYCoreCellInfo.h"
#import "XRProfileDetailCell.h"
#import <ZYCoreFramework/ZYCoreDefine.h>

@interface XRProfileViewController ()

@end

@implementation XRProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = LOCALSTRING(@"个人信息");
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.backgroundColor = [UIColor colorWithRed:239/255. green:239/255. blue:239/255. alpha:1];
    [self setupData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupData
{
    NSArray *firstTypes = @[@(ProfileDetailTypeAvatar),@(ProfileDetailTypeNickName),@(ProfileDetailTypePassword)];
    NSArray *secondTypes = @[@(ProfileDetailTypeLocation),@(ProfileDetailTypeIntroduction)];
//    NSArray *jumpViewControllers = @[[XRDonateBookCollectionViewController new],
//                                     [UIViewController viewControllerWithIdentifer:NSStringFromClass([XRBorrowRecordViewController class]) withStoryboardName:@"Main"],
//                                     [XRShareBookCollectionViewController new],
//                                     [UIViewController viewControllerWithIdentifer:NSStringFromClass([XRMemberPointViewController class]) withStoryboardName:@"Main"]];
    NSMutableArray *section1 = [NSMutableArray array];
    [firstTypes enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *cellData = @{@"type":obj};
        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRProfileDetailCell class] withCellHeight:[XRProfileDetailCell cellHeightForType:[obj integerValue]] withCellData:cellData withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
//            UIViewController *viewController = jumpViewControllers[idx];
//            viewController.hidesBottomBarWhenPushed = YES;
//            dispatch_async(dispatch_get_main_queue(),^{
//                [self.navigationController pushViewController:viewController animated:YES];
//            });
        }];
        cellInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [section1 addObject:cellInfo];
    }];
    
    NSMutableArray *section2 = [NSMutableArray array];
    [secondTypes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *cellData = @{@"type":obj};
        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRProfileDetailCell class] withCellHeight:[XRProfileDetailCell cellHeightForType:[obj integerValue]] withCellData:cellData withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
//            UIViewController *viewController = jumpViewControllers[idx];
//            viewController.hidesBottomBarWhenPushed = YES;
//            dispatch_async(dispatch_get_main_queue(),^{
//                [self.navigationController pushViewController:viewController animated:YES];
//            });
        }];
        cellInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [section2 addObject:cellInfo];
    }];
    
    self.tableViewData = @[section1, section2];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 22;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 22)];
    view.backgroundColor = [UIColor colorWithRed:239/255. green:239/255. blue:239/255. alpha:1];
    return view;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
