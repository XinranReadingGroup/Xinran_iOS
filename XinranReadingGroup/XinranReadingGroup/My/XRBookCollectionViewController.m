//
//  XRBookCollectionViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/10/18.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreDefine.h>
#import <ZYCoreFramework/UIViewController+ZYCore.h>
#import "XRBookCollectionViewController.h"
#import "XRBookListEntity.h"
#import "XRBookCollectionViewCell.h"
#import "View+MASAdditions.h"
#import "XRBookRecordEntity.h"
#import "XRBorrowedBookDetaiViewController.h"
#import "XRSharedBookDetailController.h"

static CGFloat const HEIGHT_TITLE = 30;

@interface XRBookCollectionViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@end

@implementation XRBookCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = RGBCOLOR(242, 242, 242);
    [self setupTitleView];
    [self setupColletionView];
}

- (void)setupTitleView {
    UIView *titleBg = [[UIView alloc] init];
    titleBg.backgroundColor = RGBACOLOR(0,0,0,0.8);
    [self.view addSubview:titleBg];
    [titleBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@64);
        make.height.mas_equalTo([NSNumber numberWithFloat:HEIGHT_TITLE]);
        make.leading.mas_equalTo(@0);
        make.trailing.mas_equalTo(@0);
    }];

    self.infoLabel = [[UILabel alloc] init];
    //for test
//    title.text = @"您共享了11本书";
    //test end
    self.infoLabel.font = [UIFont systemFontOfSize:14.];
    self.infoLabel.textColor = [UIColor whiteColor];
    [titleBg addSubview:self.infoLabel];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(@15);
        make.trailing.mas_equalTo(@0);
        make.top.mas_equalTo(@0);
        make.bottom.mas_equalTo(@0);
    }];
}

- (void)setupColletionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.layer.shadowColor = RGBCOLOR(215, 215, 215).CGColor;
    self.collectionView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    [self.collectionView registerClass:[XRBookCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([XRBookCollectionViewCell class])];
    [self.view addSubview:self.collectionView];

    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(HEIGHT_TITLE + 10 + 64, 10, 10, 10));
    }];
}

#pragma mark - CollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.bookList.bookList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XRBookCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([XRBookCollectionViewCell class]) forIndexPath:indexPath];
    cell.data = self.bookList.bookList[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    XRBookDetailEntity *bookDetailEntity = self.bookList.bookList[indexPath.row];
    switch (bookDetailEntity.onOffStockRecord.bookType) {
        case kBookTypeBorrow:
        {
            XRBorrowedBookDetaiViewController *detailViewController = (XRBorrowedBookDetaiViewController *)[UIViewController viewControllerWithIdentifer:@"XRBookDetailBaseViewController" withStoryboardName:@"Main"];
            detailViewController.bookData = bookDetailEntity;
            [self.navigationController pushViewController:detailViewController animated:YES];
        }
            break;
        case kBookTypeShare:
        {
            XRSharedBookDetailController *detailViewController = (XRSharedBookDetailController *)[UIViewController viewControllerWithIdentifer:@"XRBookDetailBaseViewControllerr" withStoryboardName:@"Main"];
            detailViewController.bookData = bookDetailEntity;
            [self.navigationController pushViewController:detailViewController animated:YES];
        }
        default:
            break;
    }
}

#pragma mark - FlowLayoutDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(66,150);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20,20,20,20);
}



@end
