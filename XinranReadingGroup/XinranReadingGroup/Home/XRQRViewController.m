//
//  XRQRViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/17.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRQRViewController.h"
#import <ZYCoreDefine.h>
#import "XRBookService.h"
#import <Masonry.h>
#import <ZYCoreHintAssistant.h>

@interface XRQRViewController ()


@end

@implementation XRQRViewController

- (void)setNotice:(NSString *)notice {
    _notice = notice;
    _noticeLabel.text = notice;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
}

- (void)setupUI {
    //中间的框框
    self.centerView = [[UIView alloc] init];
    [self.view addSubview:self.centerView];
    __weak UIView *weakCenterView = self.centerView;
    CGFloat offSet = 150;
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(offSet - 80);
        make.bottom.equalTo(self.view).with.offset(- offSet - 80);
        make.width.equalTo(weakCenterView.mas_height);
        make.centerX.equalTo(self.view);
    }];
    self.centerView.layer.borderColor = RGBACOLOR(255, 255, 255, 0.3).CGColor;
    self.centerView.layer.borderWidth = 0.5;
    
    UIImageView *centerBg = [[UIImageView alloc] init];
    [self.centerView addSubview:centerBg];
    centerBg.image = [[UIImage imageNamed:@"qr_center_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    centerBg.contentMode = UIViewContentModeScaleToFill;
    [centerBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.centerView);
    }];

    //半透明背景
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
    [self.view addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.leading.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.trailing.equalTo(self.centerView.mas_leading);
    }];

    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
    [self.view addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.leading.equalTo(self.centerView.mas_trailing);
        make.trailing.equalTo(self.view);
    }];

    UIView *topView = [[UIView alloc] init];
    [self.view addSubview:topView];
    topView.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.leading.equalTo(leftView.mas_trailing);
        make.trailing.equalTo(rightView.mas_leading);
        make.bottom.equalTo(self.centerView.mas_top);
    }];

    UIView *bottomView = [[UIView alloc] init];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.centerView.mas_bottom);
        make.bottom.equalTo(self.view);
        make.leading.equalTo(leftView.mas_trailing);
        make.trailing.equalTo(rightView.mas_leading);
    }];
    
    //下方的提示文字
    self.noticeLabel = [[UILabel alloc] init];
    [self.view addSubview:self.noticeLabel];
    self.noticeLabel.font = [UIFont systemFontOfSize:12.];
    self.noticeLabel.textColor = [UIColor whiteColor];
    self.noticeLabel.backgroundColor = [UIColor clearColor];
    self.noticeLabel.textAlignment = NSTextAlignmentCenter;
    [self.noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.centerView.mas_bottom).offset(25);
        make.height.mas_equalTo(50);
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
    }];
}

- (void)scanFinish:(NSString *)result {
	if (!result) {
        if (self.scanFailed) {
            self.scanFailed();
        }
        else {
            [ZYCoreHintAssistant showAlertViewWithTitle:@"扫描失败，再试一次吧"];
        }
		return;
	}
    if (self.scanSuccess) {
        self.scanSuccess(result);
    }
    self.shouldRead = NO;
}

@end
