//
//  XRMemberPointViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/11/25.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRMemberPointViewController.h"
#import "XRUserService.h"
#import "XRLoginBiz.h"
#import "XRUser.h"
#import "XRUserProfile.h"
#import "XRActivityListEntity.h"
#import "ZYCoreCellInfo.h"
#import "XRPointExchangeCell.h"

@interface XRMemberPointViewController ()

@property (weak, nonatomic) IBOutlet UILabel *pointSum;

@end

@implementation XRMemberPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self fetchData];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self fetchData];
}

- (void)fetchData {
    [XRLoginBiz refreshUserProfile:^{
        if ([[XRUser sharedXRUser].profile.score integerValue] > 0) {
            self.pointSum.text = [NSString stringWithFormat:@"亲，您当前的公益积分为%@",[XRUser sharedXRUser].profile.score];
        } else {
            self.pointSum.text = [NSString stringWithFormat:@"亲，您当前的公益积分为0"];
        }
    }];
    [XRUserService fetchActivity:^(XRActivityListEntity *activityList) {
        
        NSMutableArray *sectionInfo = [NSMutableArray array];
        [activityList.activityList enumerateObjectsUsingBlock:^(XRActivityEntity *obj, NSUInteger idx, BOOL *stop) {
            ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRPointExchangeCell class] withCellHeight:120 withCellData:obj withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
                
            }];
            cellInfo.doNotRegisterClass = YES;
            [sectionInfo addObject:cellInfo];
        }];
        self.tableViewData = @[[sectionInfo copy]];
    } failure:nil];
}

@end
