//
//  XRDonateViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/28.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRDonateViewController.h"
#import "XRBookService.h"
#import "View+MASAdditions.h"
#import "UIButton+XRButton.h"
#import "SVProgressHUD.h"
#import "XRBookEntity.h"
#import "XREditBookInfoViewController.h"
#import <UIView+ZYCore.h>
#import <ZYCoreDefine.h>
#import <BlocksKit/UIAlertView+BlocksKit.h>
#import <ZYCoreFramework/UIViewController+ZYCore.h>

@interface XRDonateViewController ()

@end

@implementation XRDonateViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    [self setObjectTypes:@[AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeEAN8Code]];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)setupUI {
    self.notice = LOCALSTRING(@"将ISBN条形码放入框内，即可自动扫描");
    [super setupUI];
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
    //搜索有木有相关书籍
    [SVProgressHUD showWithStatus:LOCALSTRING(@"扫描成功，获取书籍信息中")];
    [XRBookService bookDetailWithISBN:result success:^(id param) {
        XRBookEntity *entity = param;
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            XREditBookInfoViewController *editBookInfoViewController = (XREditBookInfoViewController *)[UIViewController viewControllerWithIdentifer:NSStringFromClass([XREditBookInfoViewController class]) withStoryboardName:@"Main"];
            editBookInfoViewController.bookData = entity;
            editBookInfoViewController.sumbitCallback = self.sumitCallBack;
            [self.navigationController pushViewController:editBookInfoViewController animated:YES];
        });
    } failure:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(),^{
            [SVProgressHUD dismiss];
            //暂时先不可以捐赠
            UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:LOCALSTRING(@"获取书籍信息失败，该书籍无法捐赠")];
            [alertView show];
            //以后要开放
            /**
            UIAlertView *alertView = [UIAlertView bk_showAlertViewWithTitle:LOCALSTRING(@"获取书籍信息失败") message:nil cancelButtonTitle:LOCALSTRING(@"重新扫描") otherButtonTitles:@[@"手动输入"] handler:^(UIAlertView *alertView, NSInteger integer) {
                if (integer == 1) {
                    //手动输入
                    dispatch_async(dispatch_get_main_queue(), ^{
                        XREditBookInfoViewController *editBookInfoViewController = (XREditBookInfoViewController *)[UIViewController viewControllerWithIdentifer:NSStringFromClass([XREditBookInfoViewController class]) withStoryboardName:@"Main"];
                        editBookInfoViewController.sumbitCallback = self.sumitCallBack;
                        [self.navigationController pushViewController:editBookInfoViewController animated:YES];
                    });
                }
                else if (integer == 0) {
                    [self startReading];
                }
            }];
            [alertView show];
            **/
        });
    }];
}

- (void)inputButtonTapped {
    [self pushToViewControllerWithStoryboardName:@"Main" viewController:@"XREditBookInfoViewController"];
}

@end
