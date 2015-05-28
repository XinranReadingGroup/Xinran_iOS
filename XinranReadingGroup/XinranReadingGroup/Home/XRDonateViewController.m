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

- (void)initUI {
	[super initUI];
	UIView *redLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 2)];
	redLine.backgroundColor = RGBACOLOR(255, 0, 0, 0.7);
	redLine.centerX = self.view.width / 2;
	redLine.centerY = self.view.height / 2;
    redLine.tag = 50000;
	[self.view addSubview:redLine];
}

- (void)scanFinish:(NSString *)result {
	[super scanFinish:result];
	XRDonateResultViewController *donateViewController = [[XRDonateResultViewController alloc] init];
	donateViewController.ISBN = result;
	[self.navigationController pushViewController:donateViewController animated:YES];
	[self startReading];
}

@end
