//
//  XRBookQRViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/17.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookQRViewController.h"
#import <ZYCoreDefine.h>
#import <UIAlertView+BlocksKit.h>
#import "XRBookService.h"
#import "XRBookDetailEntity.h"
#import "XRBookEntity.h"
#import <NSString+ZYCore.h>
#import "XRBookRecordEntity.h"
#import <ZYCoreHintAssistant.h>
#import <Masonry/View+MASAdditions.h>
#import <ZYCoreFramework/UIView+ZYCore.h>
#import "XRBorrowResultViewController.h"
#import "SVProgressHUD.h"

@interface XRBookQRViewController ()

@property (nonatomic) MASConstraint *lightHeightConstraint;
@property (nonatomic) UIImageView *lightLine;

@end

@implementation XRBookQRViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startAnimation];
}


- (void)setupUI {
    [super setupUI];
    [self setupScanAnimation];
    [self setupInfo];
}

- (void)setupScanAnimation {
    self.lightLine = [[UIImageView alloc] init];
    self.lightLine.image = [[UIImage imageNamed:@"qr_light_line"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 40, 0, 40)];
    __weak UIImageView *weakLightLine = self.lightLine;
    [self.centerView addSubview:self.lightLine];
    [self.lightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.centerView).offset(-10);
        make.height.mas_equalTo(weakLightLine.image.size.height);
        make.centerX.equalTo(self.centerView);
        self.lightHeightConstraint = make.top.mas_equalTo(0);
    }];
}


- (void)startAnimation {
    self.lightHeightConstraint.mas_equalTo(self.centerView.height - self.lightLine.height);

    [UIView animateWithDuration:1.5 animations:^{
        [UIView setAnimationRepeatCount:CGFLOAT_MAX];
        [self.centerView layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setupInfo {
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.text = LOCALSTRING(@"将书背面的享阅二维码放入框中，即可扫描");
    textLabel.font = [UIFont systemFontOfSize:14.];
    textLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.centerView.mas_bottom).offset(30);
        make.centerX.equalTo(self.centerView);
    }];
}

- (void)scanFinish:(NSString *)result {
    [super scanFinish:result];
    [SVProgressHUD showWithStatus:LOCALSTRING(@"扫码成功，书籍信息获取中……")];
    [XRBookService bookDetailWithBookID:result success: ^(id param) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        XRBookDetailEntity *bookEntity = param;
        [self scanBookSuccess:bookEntity];
    } failure: ^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:LOCALSTRING(@"书籍信息获取失败")];
        [alertView bk_setCancelButtonWithTitle:LOCALSTRING(@"好") handler: ^{
            [self startReading];
        }];
        [alertView show];
    }];
}

- (void)scanBookSuccess:(XRBookDetailEntity *)bookData {

}

@end
