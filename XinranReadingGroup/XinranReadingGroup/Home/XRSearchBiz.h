//
//  XRSearchBiz.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZYBlockDefine.h>

@class XRBookListEntity;

@interface XRSearchBiz : NSObject

@property (nonatomic, strong) XRBookListEntity *bookList;
@property (nonatomic) NSInteger currentPage;
@property (nonatomic, strong) NSString *keyword;

- (void)fetchSearchResult:(NSString *)keyword success:(ZYBlock)success failure:(ZYErrorBlock)failure;

- (void)loadMoreSearchResult:(ZYBlock)success failure:(ZYErrorBlock)failure;

@end
