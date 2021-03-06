//
//  XRDonateResultViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/28.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreDefine.h>
#import "XRDonateResultViewController.h"
#import "SVProgressHUD.h"
#import "XRBookService.h"
#import "XRBookEntity.h"
#import "XRBookRecordEntity.h"
#import "UIButton+XRButton.h"
#import "XRQRViewController.h"
#import <DUQRAssistant.h>
#import <Masonry/View+MASAdditions.h>
#import <UIView+ZYCore.h>

@interface XRDonateResultViewController ()

@property (nonatomic) XRBookRecordEntity *donateBookDetail;

@end

@implementation XRDonateResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self setupUI];
    [self submitDonateBook];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)submitDonateBook {
    if (self.bookData) {
        [SVProgressHUD showWithStatus:LOCALSTRING(@"捐书进行中")];
        [XRBookService donateBook:self.bookData.bookID success:^(id param) {
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

- (void)setupUI {
    self.view.backgroundColor = RGBCOLOR(242, 242, 242);
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
    resultLabel.text = LOCALSTRING(@"捐书成功啦~ 恭喜获得10个公益积分~");
    resultLabel.font = [UIFont systemFontOfSize:16.];
    [resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(resultIcon.mas_bottom).offset(27);
        make.centerX.equalTo(resultIcon);
    }];

    UIImage *QRImage = [DUQRAssistant createQRImage:self.donateBookDetail.bookID withWidth:150];
    UIImageView *QRImageView = [[UIImageView alloc] initWithImage:QRImage];
    [self.view addSubview:QRImageView];
    [QRImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(resultLabel.mas_bottom).offset(50);
        make.centerX.equalTo(resultLabel);
    }];

    UIButton *printButton = [UIButton blueRoundedRectButtonWithTitle:LOCALSTRING(@"打印公益码")];
    [self.view addSubview:printButton];
    __weak UIButton *weakPrintButton = printButton;
    [printButton mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong UIButton *strongPrintButton = weakPrintButton;
        make.top.mas_equalTo(QRImageView.mas_bottom).offset(50);
        make.centerX.equalTo(QRImageView);
        make.height.mas_equalTo(strongPrintButton.height + 5);
        make.width.mas_equalTo(strongPrintButton.width + strongPrintButton.height);
    }];
    UIButton *continueButton = [UIButton redRoundedRectButtonWithTitle:LOCALSTRING(@"继续捐书")];
    [self.view addSubview:continueButton];
    [continueButton addTarget:self action:@selector(continueDonateBookTapped:) forControlEvents:UIControlEventTouchUpInside];
    __weak UIButton *weakContinueButton = continueButton;
    [continueButton mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong UIButton *strongContinueButton = weakContinueButton;
        make.top.mas_equalTo(printButton.mas_bottom).offset(20);
        make.centerX.equalTo(printButton);
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
    resultLabel.text = LOCALSTRING(@"捐书失败啦~ 请返回重试");
    resultLabel.font = [UIFont systemFontOfSize:16.];
    [resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(resultIcon.mas_bottom).offset(27);
        make.centerX.equalTo(resultIcon);
    }];
}

- (void)printQRCodeTapped {
    //TODO 打印二维码
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
