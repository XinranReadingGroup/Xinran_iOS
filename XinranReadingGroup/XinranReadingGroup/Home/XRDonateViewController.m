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

- (void)scanFinish:(NSString *)result {
	[super scanFinish:result];
	XRDonateResultViewController *donateViewController = [[XRDonateResultViewController alloc] init];
	donateViewController.ISBN = result;
	[self.navigationController pushViewController:donateViewController animated:YES];
}

@end
