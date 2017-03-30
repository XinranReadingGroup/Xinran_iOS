//
//  XRBookInfoCell.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/21.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookInfoCell.h"
#import <UIImageView+WebCache.h>
#import "XRBookEntity.h"
#import "XRBookDetailEntity.h"
#import "XRBookRecordEntity.h"

@implementation XRBookInfoCell

- (void)setBookData:(XRBookDetailEntity *)bookData {
	_bookData = bookData;
	[self reloadCell];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

- (void)reloadCell {
	[self.bookCover sd_setImageWithURL:[NSURL URLWithString:self.bookData.book.imgURL]];
	self.bookTitle.text = self.bookData.book.title;
	self.bookDetail.text = [self bookDetailText];
}

- (NSString *)bookDetailText {
	//作者、出版社
	NSMutableString *detailString = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%@/%@", self.bookData.book.author, self.bookData.book.publisher]];
	//捐书人
	if (self.bookData.onOffStockRecord.ownerNickName) {
		[detailString appendString:[NSString stringWithFormat:@"\n捐书人 %@", self.bookData.onOffStockRecord.ownerNickName]];
	}
	//书架
	if (self.bookData.onOffStockRecord.locationName) {
		[detailString appendString:self.bookData.onOffStockRecord.locationName];
	}
	
	return detailString;
}

+ (CGFloat)cellHeight {
	return 102;
}

@end
