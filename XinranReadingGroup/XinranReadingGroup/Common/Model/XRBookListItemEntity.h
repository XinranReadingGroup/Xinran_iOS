//
//  XRBookListEntity.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XREntity.h"
#import "XRBookEntity.h"

@protocol XRBookListItemEntity <NSObject>

@end

@interface XRBookListItemEntity : XREntity

@property (nonatomic, strong) NSString *sectionName;
@property (nonatomic, strong) NSArray<XRBookEntity> *books;

@end
