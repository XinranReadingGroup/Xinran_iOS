//
//  XRHomeViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRHomeViewController.h"
#import <UIViewController+navigationBarItem.h>
#import "XRBorrowBookQRViewController.h"

@interface XRHomeViewController ()

@end

@implementation XRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)borrowButtonTapped:(UIButton *)sender {
    XRBorrowBookQRViewController *qrViewController = [[XRBorrowBookQRViewController alloc] init];
    qrViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:qrViewController animated:YES];
}


- (void)initNavigationBar {
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
