//
//  XRBookDetailEntity.h
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/21.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XREntity.h"

@class XRBookEntity;
@class XRBookRecordEntity;
@class XRBookOwnerEntity;
@class XRBookDetailLocationEntity;

@protocol XRBookDetailEntity <NSObject>

@end

@interface XRBookDetailEntity : XREntity

@property (nonatomic, strong) XRBookRecordEntity *onOffStockRecord;
@property (nonatomic, strong) XRBookEntity *book;
@property (nonatomic, strong) XRBookOwnerEntity *ownerUserVO;
@property (nonatomic, strong) XRBookDetailLocationEntity *bookLocationVO;

@end
