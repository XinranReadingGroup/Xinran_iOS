//
//  XRBookEntity.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XREntity.h"

typedef enum {
	kBookStatusAvaliable,           //可借
	kBookStatusBorrowed,            //已借
}BookStatus;

typedef enum {
	kBookTypeBorrow,                //借阅书，已经捐了的书
	kBookTypeShare,                 //分享书，不捐但是可以借给人家的书
	kBookTypeUnknown,               //未知类型
}BookType;

@protocol XRBookEntity <NSObject>

@end

@interface XRBookEntity : XREntity

@property (nonatomic, strong) NSString *bookID;
@property (nonatomic, strong) NSString *title;  //书名
@property (nonatomic, strong) NSString *author;  //作者
@property (nonatomic, strong) NSString *publisher;  //出版社å
@property (nonatomic, strong) NSString *summary;  //简介
@property (nonatomic, strong) NSString *imgURL;  //封面图
@property (nonatomic, strong) NSString *isbn;  //书籍的ISBN号
@property (nonatomic, strong) NSString *price;  //价格

@property (nonatomic, strong) NSString *donator;  //捐书人
@property (nonatomic, strong) NSString *bookcase;  //书架
@property (nonatomic) NSInteger createdAt;         //创建时间
@property (nonatomic) NSInteger updatedAt;         //修改时间
@property (nonatomic) BookStatus bookStatus;        //书的状态：可借，已借
@property (nonatomic) BookType type;          //书的类型，借阅书或者分享书

@end
