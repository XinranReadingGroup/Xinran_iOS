//
//  XRDonateRelationViewController.m
//  XinranReadingGroup
//
//  Created by peichuang on 16/10/3.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRDonateRelationViewController.h"
#import "View+MASAdditions.h"
#import "UIButton+XRButton.h"
#import "SVProgressHUD.h"
#import "XRBookService.h"
#import "XRDonateResultViewController.h"
#import <UIView+ZYCore.h>
#import <ZYCoreDefine.h>
#import <BlocksKit/UIAlertView+BlocksKit.h>
#import <ZYCoreFramework/UIViewController+ZYCore.h>

@interface XRDonateRelationViewController ()

@end

@implementation XRDonateRelationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    [super setupUI];
    self.notice = LOCALSTRING(@"将码放入框内，即可自动扫描");
}

- (void)scanFinish:(NSString *)result {
    if (!result) {
        UIAlertView *alertView = [UIAlertView bk_showAlertViewWithTitle:@"扫描失败" message:nil cancelButtonTitle:@"重新扫描" otherButtonTitles:@[@"手动输入"] handler:^(UIAlertView *alertView, NSInteger integer) {
            if (integer == 1) {
                //手动输入
                [self pushToViewControllerWithStoryboardName:@"Main" viewController:@"XREditBookInfoViewController"];
            }
            else if (integer == 0) {
                [self startReading];
            }
        }];
        [alertView show];
    }
    //关联二维码
    [SVProgressHUD showWithStatus:LOCALSTRING(@"扫描成功，正在关联二维码")];
    XRDonateResultViewController *donateResultViewController = [XRDonateResultViewController new];
    
    [XRBookService donateBook:self.bookData.bookID success:^(id param) {
        if (param && [param isKindOfClass:[XRBookRecordEntity class]]) {
            donateResultViewController.success = YES;
            donateResultViewController.donateBookDetail = param;
        } else {
            donateResultViewController.success = NO;
        }
        [SVProgressHUD dismiss];
        [self.navigationController pushViewController:donateResultViewController animated:YES];
    } failure:^(NSError *error) {
        donateResultViewController.donateBookDetail = nil;
        donateResultViewController.success = NO;
        [SVProgressHUD dismiss];
        [self.navigationController pushViewController:donateResultViewController animated:YES];
    }];
}

- (void)inputButtonTapped {
    
}


@end
