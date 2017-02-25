//
//  XRShareResultViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/4.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreDefine.h>
#import "XRShareResultViewController.h"
#import "XRBookRecordEntity.h"
#import "SVProgressHUD.h"
#import "XRBookService.h"
#import "UIButton+XRButton.h"
#import "XRQRViewController.h"
#import <Masonry.h>
#import <UIView+ZYCore.h>

@interface XRShareResultViewController ()

@property(nonatomic, strong) XRBookRecordEntity *donateBookDetail;

@end

@implementation XRShareResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self setupUI];
    [self submitShareBook];
}

- (void)setupUI {
    self.view.backgroundColor = RGBCOLOR(242, 242, 242);
}

- (void)submitShareBook {
    if (self.bookData) {
        [SVProgressHUD showWithStatus:LOCALSTRING(@"捐书进行中")];
        [XRBookService shareBookBookId:self.bookData.bookID QRCode:@"" locationID:@1 success:^(id param) {
            self.donateBookDetail = (XRBookRecordEntity *)param;
            dispatch_async(dispatch_get_main_queue(),^{
                [SVProgressHUD dismiss];
                [self showSuccessView];
            });
        } failure:^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(),^{
                [SVProgressHUD dismiss];
                [self showFailView];
            });
        }];
    }
    else {
        [self showFailView];
    }
}

- (void)showSuccessView {
    UIImageView *resultIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"result_donate_success"]];
    [self.view addSubview:resultIcon];
    [resultIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(resultIcon.image.size);
        make.top.equalTo(self.view).offset(50);
        make.centerX.equalTo(self.view);
    }];

    UILabel *resultLabel = [[UILabel alloc] init];
    [self.view addSubview:resultLabel];
    resultLabel.text = LOCALSTRING(@"享书成功啦~ 其他人能看到你分享的书咯~");
    resultLabel.font = [UIFont systemFontOfSize:16.];
    [resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(resultIcon.mas_bottom).offset(27);
        make.centerX.equalTo(resultIcon);
    }];

    UIButton *continueButton = [UIButton redRoundedRectButtonWithTitle:LOCALSTRING(@"继续捐书")];
    [self.view addSubview:continueButton];
    [continueButton addTarget:self action:@selector(continueDonateBookTapped:) forControlEvents:UIControlEventTouchUpInside];
    __weak UIButton *weakContinueButton = continueButton;
    [continueButton mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong UIButton *strongContinueButton = weakContinueButton;
        make.top.mas_equalTo(resultLabel.mas_bottom).offset(50);
        make.centerX.equalTo(resultLabel);
        make.height.mas_equalTo(strongContinueButton.height + 5);
        make.width.mas_equalTo(strongContinueButton.width + strongContinueButton.height);
    }];
}

- (void)showFailView {
    //TODO 捐书失败的Icon要换
    UIImageView *resultIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"result_donate_success"]];
    [self.view addSubview:resultIcon];
    [resultIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(resultIcon.image.size);
        make.top.equalTo(self.view).offset(50);
        make.centerX.equalTo(self.view);
    }];

    UILabel *resultLabel = [[UILabel alloc] init];
    [self.view addSubview:resultLabel];
    resultLabel.text = LOCALSTRING(@"享书失败啦~ 请返回重试");
    resultLabel.font = [UIFont systemFontOfSize:16.];
    [resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(resultIcon.mas_bottom).offset(27);
        make.centerX.equalTo(resultIcon);
    }];
}


- (void)continueDonateBookTapped:(UIButton *)button {
    __block UIViewController *QRViewController = nil;
    [self.navigationController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[XRQRViewController class]]) {
            QRViewController = obj;
            *stop = YES;
        }
    }];
    [self.navigationController popToViewController:QRViewController animated:YES];
}


@end
