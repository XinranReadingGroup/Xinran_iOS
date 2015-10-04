//
//  XRHomeViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRHomeViewController.h"
#import "XRBorrowBookQRViewController.h"
#import "XRDonateViewController.h"
#import <ZYCoreDefine.h>
#import "XRBookEntity.h"
#import "XRBookDetailEntity.h"
#import "XRDonateResultViewController.h"
#import "XRShareResultViewController.h"

@interface XRHomeViewController ()

@end

@implementation XRHomeViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)borrowButtonTapped:(UIButton *)sender {
	XRBorrowBookQRViewController *qrViewController = [[XRBorrowBookQRViewController alloc] init];
	qrViewController.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:qrViewController animated:YES];
}

//捐书
- (IBAction)donateButtonTapped:(UIButton *)sender {
	XRDonateViewController *donateViewController = [[XRDonateViewController alloc] init];
	donateViewController.title = LOCALSTRING(@"捐书");
	donateViewController.hidesBottomBarWhenPushed = YES;
	donateViewController.sumitCallBack = ^(XRBookEntity *bookData) {
		//捐书之后
		XRDonateResultViewController *donateResultViewController = [XRDonateResultViewController new];
		donateResultViewController.bookData = bookData;
		dispatch_async(dispatch_get_main_queue(),^{
			[self.navigationController pushViewController:donateResultViewController animated:YES];
		});
	};
	[self.navigationController pushViewController:donateViewController animated:YES];
}

//享书
- (IBAction)shareBookTapped:(UIButton *)sender {
	XRDonateViewController *donateViewController = [[XRDonateViewController alloc] init];
	donateViewController.title = LOCALSTRING(@"享书");
	donateViewController.hidesBottomBarWhenPushed = YES;
	donateViewController.sumitCallBack = ^(XRBookEntity *bookData) {
		//捐书之后
		XRShareResultViewController *shareResultViewController = [XRShareResultViewController new];
		shareResultViewController.bookData = bookData;
		dispatch_async(dispatch_get_main_queue(),^{
			[self.navigationController pushViewController:shareResultViewController animated:YES];
		});
	};
	[self.navigationController pushViewController:donateViewController animated:YES];
}


- (void)initNavigationBar {
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
