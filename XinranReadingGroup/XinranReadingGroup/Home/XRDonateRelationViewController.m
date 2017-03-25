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
#import "XRAddressEntity.h"
#import "XRNetwork.h"

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
    self.notice = LOCALSTRING(@"将二维码放入框内，即可自动扫描");
    [super setupUI];
    self.title = LOCALSTRING(@"关联二维码");
}

- (void)scanFinish:(NSString *)result {
    if (!result) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"扫描失败" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"重新扫描" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self startReading];
        }]];
        [self presentViewController:alertController animated:YES completion:NULL];
        return;
    }
    //关联二维码
    [SVProgressHUD showWithStatus:LOCALSTRING(@"扫描成功，正在关联二维码")];
    XRDonateResultViewController *donateResultViewController = [XRDonateResultViewController new];
    
    [XRBookService donateBook:self.bookData.bookID QRCode:result locationID:self.address.addressID success:^(id param) {
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
        [SVProgressHUD showErrorWithStatus:error.userInfo[KEY_NETWORK_ERROR_MESSAGE]];
    }];
}

- (void)inputButtonTapped {
    
}


@end
