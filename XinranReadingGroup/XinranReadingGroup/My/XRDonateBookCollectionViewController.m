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
    //self.infoLabel.text = @"您捐赠了0本书";
    [self fetchData];
}

- (void)fetchData {
    [XRUserService fetchDonateRecord:^(id param) {
        self.bookList = param;
        dispatch_async(dispatch_get_main_queue(),^{
            self.infoLabel.text = [NSString stringWithFormat:@"您捐赠了%lu本书",(unsigned long)self.bookList.bookList.count];
            [self.collectionView reloadData];
        });
    } failure:nil];
}

@end
