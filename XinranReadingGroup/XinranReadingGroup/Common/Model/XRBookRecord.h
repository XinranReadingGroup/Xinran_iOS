//
//  XRBookRecord.h
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/21.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XREntity.h"

@interface XRBookRecord : XREntity

@property (nonatomic, strong) NSNumber *bookID;
@property (nonatomic, strong) NSNumber *createdAt;
@property (nonatomic, strong) NSNumber *updatedAt;
@property (nonatomic, strong) NSNumber *bookId;
@property (nonatomic, strong) NSNumber *bookType;
@property (nonatomic, strong) NSNumber *ownerUserId;
@property (nonatomic, strong) NSString *ownerPhone;
@property (nonatomic, strong) NSNumber *location;
@property (nonatomic, strong) NSNumber *onStockDate;
@property (nonatomic, strong) NSNumber *offStockDate;
@property (nonatomic, strong) NSNumber *borrowId;
@property (nonatomic, strong) NSNumber *borrowUserId;
@property (nonatomic) NSInteger borrowStatus;

@end
