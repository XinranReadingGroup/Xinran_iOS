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
#import "XRProfileEditViewController.h"
#import "XRUser.h"
#import "XRUserService.h"
#import "XRLoginBiz.h"
#import "SVProgressHUD.h"
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
    NSArray *secondTypes = @[@(ProfileDetailTypeIntroduction)];

    NSMutableArray *section1 = [NSMutableArray array];
    [firstTypes enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *cellData = @{@"type":obj};
        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRProfileDetailCell class] withCellHeight:[XRProfileDetailCell cellHeightForType:[obj integerValue]] withCellData:cellData withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, ZYCoreCellInfo *cellData) {
            ProfileDetailType type = [[cellData.cellData objectForKey:@"type"] integerValue];
            if (type == ProfileDetailTypeNickName) {
                XRProfileEditViewController *profileEditController = [[XRProfileEditViewController alloc] initWithNibName:@"XRProfileEditViewController" bundle:nil];
                profileEditController.cellData = cellData.cellData;
                [self.navigationController pushViewController:profileEditController animated:YES];
            } else if (type == ProfileDetailTypeAvatar) {
                
            } else if (type == ProfileDetailTypePassword) {
                [SVProgressHUD showWithStatus:@"请到web页面上修改密码"];
            }
        }];
        cellInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [section1 addObject:cellInfo];
    }];
    
    NSMutableArray *section2 = [NSMutableArray array];
    [secondTypes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *cellData = @{@"type":obj};
        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRProfileDetailCell class] withCellHeight:[XRProfileDetailCell cellHeightForType:[obj integerValue]] withCellData:cellData withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, ZYCoreCellInfo *cellData) {
            ProfileDetailType type = [[cellData.cellData objectForKey:@"type"] integerValue];
            if (type == ProfileDetailTypeIntroduction) {
                XRProfileEditViewController *profileEditController = [[XRProfileEditViewController alloc] initWithNibName:@"XRProfileEditViewController" bundle:nil];
                profileEditController.cellData = cellData.cellData;
                [self.navigationController pushViewController:profileEditController animated:YES];
            }
        }];
        cellInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [section2 addObject:cellInfo];
    }];
    
    self.tableViewData = @[section1, section2];
    
    [XRLoginBiz refreshUserProfile:^{
        [self.tableView reloadData];
    }];
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
