//
//  XRDonateViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/28.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRDonateViewController.h"
#import "XRBookService.h"
#import "XRDonateResultViewController.h"
#import "View+MASAdditions.h"
#import <UIView+ZYCore.h>
#import <ZYCoreDefine.h>

@interface XRDonateViewController ()

@end

@implementation XRDonateViewController

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
    self.notice = LOCALSTRING(@"将ISBN条形码放入框内，即可自动扫描");
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

- (void)scanFinish:(NSString *)result {
	[super scanFinish:result];
	XRDonateResultViewController *donateViewController = [[XRDonateResultViewController alloc] init];
	donateViewController.ISBN = result;
	[self.navigationController pushViewController:donateViewController animated:YES];
	[self startReading];
}

@end
