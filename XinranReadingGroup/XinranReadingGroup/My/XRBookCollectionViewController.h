//
//  XRBookCollectionViewController.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/18.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZYCoreFramework/ZYCoreViewController.h>

@class XRBookListEntity;

@interface XRBookCollectionViewController : ZYCoreViewController

@property (nonatomic) XRBookListEntity *bookList;
@property (strong, nonatomic)  UICollectionView *collectionView;
@property (nonatomic) UILabel *infoLabel;

@end
