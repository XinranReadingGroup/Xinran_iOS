//
//  XRBookRecord.h
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/21.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XREntity.h"
#import "XRBookEntity.h"

typedef enum {
	kBookStatusAvaliable,           //可借
	kBookStatusBorrowed,            //已借
}BookStatus;

typedef enum {
	kBookTypeBorrow,                //借阅书，已经捐了的书
	kBookTypeShare,                 //分享书，不捐但是可以借给人家的书
	kBookTypeUnknown,               //未知类型
}BookType;

/**
 *  书本信息。用来表示一本实实在在的书
 *  这个数据结构是用来保存单个书本的相关信息，如借阅状态啦，捐献状态啦之类的。bookID是唯一的标识符，一个ISBN可以对应许多书本（BookRecord）
 */
@interface XRBookRecordEntity : XREntity

@property (nonatomic, strong) NSString *bookID;                 //真正的书籍的ID
@property (nonatomic, strong) NSNumber *createdAt;
@property (nonatomic, strong) NSNumber *updatedAt;
@property (nonatomic, strong) NSNumber *bookEntityId;                 //对应的书籍信息（BookEntity）的ID
@property (nonatomic) BookType bookType;
@property (nonatomic, strong) NSNumber *ownerUserId;
@property (nonatomic, strong) NSString *ownerPhone;
@property (nonatomic, strong) NSNumber *location;
@property (nonatomic, strong) NSNumber *onStockDate;
@property (nonatomic, strong) NSNumber *offStockDate;
@property (nonatomic, strong) NSNumber *borrowId;
@property (nonatomic, strong) NSNumber *borrowUserId;
@property (nonatomic) BookStatus borrowStatus;

@property (nonatomic, strong) NSString *ownerNickName;
@property (nonatomic, strong) NSString *locationName;

@end
