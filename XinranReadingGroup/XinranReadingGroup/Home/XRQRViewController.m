//
//  XRQRViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/17.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRQRViewController.h"
#import <ZYCoreDefine.h>
#import <UIView+ZYCore.h>
#import <AVFoundation/AVFoundation.h>
#import "XRBookService.h"
#import "XRBookEntity.h"
#import <ZYCoreHintAssistant.h>

@interface XRQRViewController ()

@end

@implementation XRQRViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self initUI];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)initUI {
	if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
	
	UIView *topBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 73)];
	topBackground.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
	UIView *leftBackground = [[UIView alloc] initWithFrame:CGRectMake(0, topBackground.bottom, (SCREEN_WIDTH - 240) / 2, 240)];
	leftBackground.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
	UIView *rightBackground = [[UIView alloc] initWithFrame:CGRectMake(leftBackground.left + 240, topBackground.bottom, (SCREEN_WIDTH - 240) / 2, 240)];
	rightBackground.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
	UIView *bottomBackground = [[UIView alloc] initWithFrame:CGRectMake(0, leftBackground.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - leftBackground.bottom)];
	bottomBackground.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
	[self.view addSubview:topBackground];
	[self.view addSubview:leftBackground];
	[self.view addSubview:rightBackground];
	[self.view addSubview:bottomBackground];
}

- (void)scanFinish:(NSString *)result {
	if (!result) {
		[ZYCoreHintAssistant showAlertViewWithTitle:LOCALSTRING(@"扫描结果为空 ~~~~(>_<)~~~~ ")];
		return;
	}
}

@end
