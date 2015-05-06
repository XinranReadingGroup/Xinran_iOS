//
//  XRBookListEntity.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookListItemEntity.h"

@class XRBookEntity;

@interface XRBookListEntity : XREntity

@property (nonatomic, strong) NSArray<XRBookEntity> *bookList;

@end
