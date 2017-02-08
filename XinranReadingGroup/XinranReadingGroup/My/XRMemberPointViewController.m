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

@interface XRMemberPointViewController ()

@property (weak, nonatomic) IBOutlet UILabel *pointSum;

@end

@implementation XRMemberPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self fetchData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self fetchData];
}

- (void)fetchData {
    [XRLoginBiz refreshUserProfile:^{
        self.pointSum.text = [NSString stringWithFormat:@"您的积分为%@",[XRUser sharedXRUser].profile.score];
    }];
    [XRUserService fetchActivity:^(id param) {
        self.tableViewData = param;
    } failure:nil];
}

@end
