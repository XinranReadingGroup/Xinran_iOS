//
//  XRMemberPointViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/11/25.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRMemberPointViewController.h"
#import "XRUserService.h"

@interface XRMemberPointViewController ()

@property (weak, nonatomic) IBOutlet UILabel *pointSum;

@end

@implementation XRMemberPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
}

- (void)fetchData {
    [XRUserService fetchMemberPoint:^(id param) {

    } failure:nil]; 
}

@end
