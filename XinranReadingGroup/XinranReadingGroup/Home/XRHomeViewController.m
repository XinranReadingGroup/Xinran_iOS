//
//  XRHomeViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRHomeViewController.h"
#import "XRDonateViewController.h"
#import <ZYCoreDefine.h>
#import <Masonry.h>
#import "XRDonateResultViewController.h"
#import "XRShareResultViewController.h"
#import "XRBorrowBookQRViewController.h"
#import "XRReturnBookQRViewController.h"
#import "UIViewController+navigationBarItem.h"
#import "SVProgressHUD.h"

@interface XRHomeViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation XRHomeViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self setTitleWithImage:@"home_title"];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.leading.mas_equalTo(@15);
//        make.trailing.mas_equalTo(@-15);
//        make.centerY.equalTo(self.view);
//        make.height.mas_equalTo(self.contentView.mas_width).multipliedBy(800/690);
	}];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

/**
 *  借书
 */
- (IBAction)borrowButtonTapped:(UIButton *)sender {
	XRBorrowBookQRViewController *qrViewController = [[XRBorrowBookQRViewController alloc] init];
	qrViewController.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:qrViewController animated:YES];
}

/**
 *  还书
 */
- (IBAction)returnBookTapped:(UIButton *)sender {
    XRReturnBookQRViewController *qrViewController = [[XRReturnBookQRViewController alloc] init];
	qrViewController.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:qrViewController animated:YES];
}


//捐书
- (IBAction)donateButtonTapped:(UIButton *)sender {
	XRDonateViewController *donateViewController = [[XRDonateViewController alloc] init];
    donateViewController.view.backgroundColor = [UIColor whiteColor];
	donateViewController.title = LOCALSTRING(@"捐书");
	donateViewController.hidesBottomBarWhenPushed = YES;
	donateViewController.sumitCallBack = ^(XRBookEntity *bookData) {
		//捐书之后
		XRDonateResultViewController *donateResultViewController = [XRDonateResultViewController new];
		dispatch_async(dispatch_get_main_queue(),^{
			[self.navigationController pushViewController:donateResultViewController animated:YES];
		});
	};
	[self.navigationController pushViewController:donateViewController animated:YES];
}

//享书
- (IBAction)shareBookTapped:(UIButton *)sender {
    [SVProgressHUD showInfoWithStatus:LOCALSTRING(@"正在建设中")];
    return;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    segue.destinationViewController.hidesBottomBarWhenPushed = YES;
}
@end
