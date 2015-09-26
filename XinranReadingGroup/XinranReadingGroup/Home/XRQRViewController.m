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
	if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	[self initUI];
}

- (void)initUI {
	CGRect centerSquare = CGRectMake((self.view.width - 240) / 2, (self.view.height - 240) / 2, 240, 240);
	
	UIView *topBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, centerSquare.origin.y)];
	topBackground.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
	UIView *leftBackground = [[UIView alloc] initWithFrame:CGRectMake(0, topBackground.bottom, centerSquare.origin.x, centerSquare.size.height)];
	leftBackground.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
	UIView *rightBackground = [[UIView alloc] initWithFrame:CGRectMake(centerSquare.origin.x + centerSquare.size.width, topBackground.bottom, self.view.width - centerSquare.origin.x - centerSquare.size.width, centerSquare.size.height)];
	rightBackground.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
	UIView *bottomBackground = [[UIView alloc] initWithFrame:CGRectMake(0, leftBackground.bottom, self.view.width, self.view.height - centerSquare.origin.y - centerSquare.size.height)];
	bottomBackground.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
	[self.view addSubview:topBackground];
	[self.view addSubview:leftBackground];
	[self.view addSubview:rightBackground];
	[self.view addSubview:bottomBackground];
}

- (void)scanFinish:(NSString *)result {
	if (!result) {
        [ZYCoreHintAssistant showAlertViewWithTitle:@"扫描失败，再试一次吧"];
		return;
	}
}

@end
