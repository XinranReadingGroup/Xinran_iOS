//
//  XRMoreTableViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/16.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreCellInfo.h>
#import <ZYCoreFramework/ZYTitleCell.h>
#import <ZYCoreFramework/ZYCoreDefine.h>
#import "XRMoreTableViewController.h"
#import "XRFeedbackViewController.h"
#import "XRShareAssistant.h"
#import <ZYTitleCell.h>
#import <ZYCoreCellInfo.h>

@interface XRMoreTableViewController ()

@property (nonatomic, strong) XRShareAssistant *shareAssistant;

@end

@implementation XRMoreTableViewController

- (XRShareAssistant *)shareAssistant {
    if (!_shareAssistant) {
        _shareAssistant = [[XRShareAssistant alloc] init];
    }
    return _shareAssistant;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.shareAssistant showShareSheet:self];
    } else if (indexPath.row == 1) {
        XRFeedbackViewController *feedBack = [[XRFeedbackViewController alloc] initWithNibName:@"XRFeedbackViewController" bundle:nil];
        [self.navigationController pushViewController:feedBack animated:YES];
    }
}

- (void)setupData {
    ZYCoreCellInfo *shareInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[ZYTitleCell class] withCellHeight:[ZYTitleCell cellHeight] withCellData:@{@"title":LOCALSTRING(@"分享给朋友")} withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
        [self.shareAssistant showShareSheet:self];
    }];
    shareInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    ZYCoreCellInfo *feedbackInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[ZYTitleCell class] withCellHeight:[ZYTitleCell cellHeight] withCellData:@{@"title":LOCALSTRING(@"意见反馈")} withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {
        XRFeedbackViewController *feedBack = [[XRFeedbackViewController alloc] initWithNibName:@"XRFeedbackViewController" bundle:nil];
        [self.navigationController pushViewController:feedBack animated:YES];
    }];
    feedbackInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    ZYCoreCellInfo *aboutInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[ZYTitleCell class] withCellHeight:[ZYTitleCell cellHeight] withCellData:@{@"title":LOCALSTRING(@"关于欣然流动读书吧")} withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData) {

    }];
    aboutInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    self.tableViewData = @[@[shareInfo,feedbackInfo,aboutInfo]];
}

@end
