//
//  XRBookEntity.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XREntity.h"


@protocol XRBookEntity <NSObject>

@end

/**
 *  书籍。将ISBN中相同的书籍中的公共部分抽象出来变成了这个数据结构
 *  这个数据结构用来记录书籍的通用信息，如作者、出版社等。同一个ISBN的BookEntity的内容是相同的
 */
@interface XRBookEntity : XREntity

@property (nonatomic, strong) NSString *bookID;
@property (nonatomic, strong) NSString *title;  //书名
@property (nonatomic, strong) NSString *author;  //作者
@property (nonatomic, strong) NSString *publisher;  //出版社å
@property (nonatomic, strong) NSString *summary;  //简介
@property (nonatomic, strong) NSString *imgURL;  //封面图
@property (nonatomic, strong) NSString *isbn;  //书籍的ISBN号
@property (nonatomic, strong) NSString *price;  //价格

@property (nonatomic) NSInteger createdAt;         //创建时间
@property (nonatomic) NSInteger updatedAt;         //修改时间

@end
