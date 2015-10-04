//
//  XRQRViewController.h
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/17.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DUCoreQRViewController.h>
#import <ZYBlockDefine.h>

/**
 *  借书时扫面二维码的界面
 */
@interface XRQRViewController : DUCoreQRViewController

@property (nonatomic) UIView *centerView;
@property (nonatomic) NSString *notice;
@property (nonatomic) UILabel *noticeLabel;
@property (nonatomic, copy) ZYStringBlock scanSuccess;
@property (nonatomic, copy) ZYBlock scanFailed;

- (void)setupUI;

@end
