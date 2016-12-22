//
//  XRBookService.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <ZYBlockDefine.h>

@class XRBookEntity;

/**
 *  关于书籍的所有接口
 */
@interface XRBookService : NSObject

/**
 *  搜索书籍
 *
 *  @param keyword 书籍的ISBN或关键字
 *  @param success 搜索成功返回书籍列表的entity
 *  @param failure 搜索失败返回error
 */
+ (void)fetchSearchResult:(NSString *)keyword startPage:(NSInteger)startPage pageSize:(NSInteger)pageSize success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

/**
 *  捐赠书籍
 *
 *  @param ISBN    书籍的ISBN号
 *  @param success 捐赠成功返回书籍信息的entity
 *  @param failure 捐赠失败返回error
 */
+ (void)donateBook:(NSString *)bookId locationID:(NSNumber *)locationID success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

/**
 *  分享书籍
 *
 *  @param ISBN    书籍的ISBN号
 *  @param success 分享成功返回书籍信息的entity
 *  @param failure 分享失败返回error
 */
+ (void)shareBookBookId:(NSString *)bookId locationID:(NSNumber *)locationID success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

/**
 *  借阅书籍
 *
 *  @param bookId  书籍的ID，不是ISBN
 *  @param success 借阅成功返回200
 *  @param failure 借阅失败返回error
 */
+ (void)borrowBook:(NSString *)bookId success:(ZYBlock)success failure:(ZYErrorBlock)failure;

/**
 *  还书
 *
 *  @param bookId  书籍的ID，不是ISBN
 *  @param success 还书成功返回200
 *  @param failure 还书失败返回error
 */
+ (void)returnBook:(NSString *)bookId success:(ZYBlock)success failure:(ZYErrorBlock)failure;

+ (void)bookDetailWithISBN:(NSString *)ISBN success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

/**
 *  通过bookID获取书籍详情
 *
 *  @param bookID  书籍的ID
 *  @param success 请求成功调用的block
 *  @param failure 请求失败调用的block
 */
+ (void)bookDetailWithBookID:(NSString *)bookID success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure;

@end
