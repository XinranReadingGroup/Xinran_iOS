//
//  XRSearchBiz.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRSearchBiz.h"
#import "XRBookListEntity.h"
#import "XRBookService.h"

static NSInteger const defaultStartPage = 0;
static NSInteger const defaultPageSize = 10;

@implementation XRSearchBiz

- (void)fetchSearchResult:(NSString *)keyword success:(ZYBlock)success failure:(ZYErrorBlock)failure {
    [XRBookService fetchSearchResult:keyword startPage:defaultStartPage pageSize:defaultPageSize success:^(id param) {
        self.keyword = keyword;
        self.bookList = param;
        self.currentPage = defaultStartPage;
        if (success) {
            success();
        }
    } failure:failure];
}

- (void)loadMoreSearchResult:(ZYBlock)success failure:(ZYErrorBlock)failure {
    [XRBookService fetchSearchResult:self.keyword startPage:(self.currentPage + 1) pageSize:defaultPageSize success:^(id param) {
        ++self.currentPage;
        if (success) {
            success();
        }
    } failure:failure];
}

@end
