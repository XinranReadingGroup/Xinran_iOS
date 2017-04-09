//
//  XRDonateBookCollectionViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/18.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRDonateBookCollectionViewController.h"
#import "XRUserService.h"
#import "XRBookListEntity.h"
#import <UIViewController+ZYCore.h>
#import "ZYCoreDefine.h"
#import "SVProgressHUD.h"

@interface XRDonateBookCollectionViewController ()

@end

@implementation XRDonateBookCollectionViewController

//- (instancetype)init {
//    self = (XRDonateBookCollectionViewController *)[UIViewController viewControllerWithIdentifer:NSStringFromClass([XRBookCollectionViewController class]) withStoryboardName:@"Main"];
//
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LOCALSTRING(@"捐书记录");
    //self.infoLabel.text = @"您捐赠了0本书";
    [self fetchData];
}

- (void)fetchData {
    [SVProgressHUD showWithStatus:nil];
    [XRUserService fetchDonateRecord:^(id param) {
        [SVProgressHUD dismiss];
        self.bookList = param;
        dispatch_async(dispatch_get_main_queue(),^{
            self.infoLabel.text = [NSString stringWithFormat:@"您捐赠了%lu本书",(unsigned long)self.bookList.bookList.count];
            [self.collectionView reloadData];
        });
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
}

@end
