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
}BookType;

@protocol XRBookEntity <NSObject>

@end

@interface XRBookEntity : XREntity

@property (nonatomic, strong) NSString *bookID;
@property (nonatomic, strong) NSString *title;          //书名
@property (nonatomic, strong) NSString *author;         //作者
@property (nonatomic, strong) NSString *press;          //出版社
@property (nonatomic, strong) NSString *summary;          //简介
@property (nonatomic, strong) NSString *imgUrl;         //封面图
@property (nonatomic) NSInteger *createAt;              //创建时间
@property (nonatomic, strong) NSString *ISBN;           //书籍的ISBN号

@property (nonatomic, strong) NSString *donator;        //捐书人
@property (nonatomic, strong) NSString *bookcase;       //书架
@property (nonatomic) BookStatus bookStatus;                //书的状态：可借，已借
@property (nonatomic) BookType type;                    //书的类型，借阅书或者分享书

@end
