//
//  XRBookDetailBiz.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/6.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookDetailBiz.h"
#import <ZYBlockDefine.h>
#import "XRBookService.h"
#import "XRBookEntity.h"
#import "XRBookDetailEntity.h"
#import "XRBookRecordEntity.h"

@implementation XRBookDetailBiz

- (void)fetchBookDetail:(ZYBlock)success failure:(ZYErrorBlock)failure {
	[XRBookService bookDetailWithBookID:self.bookData.onOffStockRecord.bookID success: ^(id param) {
	    self.bookData = param;
	    if (success) {
	        success();
		}
	} failure: ^(NSError *error) {
	    if (failure) {
	        failure(error);
		}
	}];
}

- (void)borrowBook:(ZYBlock)success failure:(ZYErrorBlock)failure {
	[XRBookService borrowBook:self.bookData.onOffStockRecord.bookID success: ^{
	    if (success) {
	        success();
		}
	} failure: ^(NSError *error) {
	    if (failure) {
	        failure(error);
		}
	}];
}

@end
