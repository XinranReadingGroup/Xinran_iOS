//
//  XRBookListEntity.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XREntity.h"
#import "XRBookListItemEntity.h"

@interface XRBookListEntity : XREntity

@property (nonatomic, strong) NSArray<XRBookListItemEntity> *bookList;

@end
