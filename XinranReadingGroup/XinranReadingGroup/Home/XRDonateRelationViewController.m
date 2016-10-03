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
    [self setObjectTypes:@[AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeEAN8Code]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    [super setupUI];
    self.notice = LOCALSTRING(@"将二位码放入框内，即可自动扫描");
    [self addLightLine];
    [self addInputButton];
}

- (void)addLightLine {
    UIImageView *lightLine = [[UIImageView alloc] init];
    lightLine.image = [[UIImage imageNamed:@"qr_light_line"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 40, 0, 40)];
    __weak UIImageView *weakLightLine = lightLine;
    [self.centerView addSubview:lightLine];
    [lightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.centerView).offset(-10);
        make.height.mas_equalTo(weakLightLine.image.size.height);
        make.center.equalTo(self.centerView);
    }];
}

- (void)addInputButton {
    UIButton *inputButton = [UIButton blueRoundedRectButtonWithTitle:LOCALSTRING(@"手动输入")];
    [self.view addSubview:inputButton];
    __weak UIButton *weakInputbutton = inputButton;
    [inputButton mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong UIButton *strongInputButton = weakInputbutton;
        make.top.mas_equalTo(self.noticeLabel.mas_bottom).offset(25);
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(strongInputButton.height + 5);
        make.width.mas_equalTo(strongInputButton.width + strongInputButton.height);
    }];
    [inputButton addTarget:self action:@selector(inputButtonTapped) forControlEvents:UIControlEventTouchUpInside];
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
