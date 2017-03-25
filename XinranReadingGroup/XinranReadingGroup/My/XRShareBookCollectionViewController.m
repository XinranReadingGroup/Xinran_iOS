//
//  XRShareBookCollectionViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/11/11.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRShareBookCollectionViewController.h"
#import "XRUserService.h"
#import "XRBookListEntity.h"
#import "ZYCoreDefine.h"

@interface XRShareBookCollectionViewController ()

@end

@implementation XRShareBookCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.infoLabel.text = @"您共享了0本书";
    self.title = LOCALSTRING(@"共享记录");
    [self fetchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)fetchData {
    [XRUserService fetchShareBook:^(id param) {
        self.bookList = param;
        self.infoLabel.text = [NSString stringWithFormat:@"您共享了%lu本书",(unsigned long)self.bookList.bookList.count];
        [self.collectionView reloadData];
    } failure:nil];
}

@end
