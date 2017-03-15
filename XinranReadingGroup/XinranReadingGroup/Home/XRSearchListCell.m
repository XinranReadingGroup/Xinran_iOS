//
//  XRSearchListCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/19.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRSearchListCell.h"
#import "XRBookEntity.h"
#import <ZYCoreDefine.h>
#import <UIImageView+WebCache.h>
#import "XRBookDetailEntity.h"
#import "XRBookRecordEntity.h"

@implementation XRSearchListCell

- (void)setData:(XRBookDetailEntity *)data {
	_data = data;
	[self reloadCell];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

- (void)reloadCell {
	self.title.text = self.data.book.title;
	self.detail.text = [self jointDetail];
	[self.type setTitle:[self bookType:self.data.onOffStockRecord.borrowStatus] forState:UIControlStateNormal];
	[self.type setTitle:[self bookType:self.data.onOffStockRecord.borrowStatus] forState:UIControlStateSelected];
	[self.type setTitle:[self bookType:self.data.onOffStockRecord.borrowStatus] forState:UIControlStateHighlighted];
	[self.type setBackgroundImage:[self bookTypeImage:self.data.onOffStockRecord.borrowStatus] forState:UIControlStateNormal];
	[self.type setBackgroundImage:[self bookTypeSelectImage:self.data.onOffStockRecord.borrowStatus] forState:UIControlStateSelected];
	[self.type setBackgroundImage:[self bookTypeSelectImage:self.data.onOffStockRecord.borrowStatus] forState:UIControlStateHighlighted];
}

- (NSString *)jointDetail {
	//封面
	[self.cover sd_setImageWithURL:[NSURL URLWithString:self.data.book.imgURL]];
	//作者、出版社
	NSMutableString *detailString = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%@/%@", self.data.book.author, self.data.book.publisher]];
	//捐书人
	if (self.data.onOffStockRecord.ownerNickName) {
		[detailString appendString:[NSString stringWithFormat:@"\n捐书人 %@", self.data.onOffStockRecord.ownerNickName]];
	}
	//书架
	if (self.data.onOffStockRecord.locationName) {
		[detailString appendString:self.data.onOffStockRecord.locationName];
	}
	
	return detailString;
}

- (NSString *)bookType:(BookStatus)status {
	NSString *bookType = @"";
	
	switch (status) {
		case kBookStatusAvaliable:
		{
			bookType = LOCALSTRING(@"可借");
		}
		break;
		
		case kBookStatusBorrowed:
		{
			bookType = LOCALSTRING(@"已借");
		}
		break;
		
		default:
		{
			bookType = LOCALSTRING(@"未知");
		}
		break;
	}
	
	return bookType;
}

- (UIImage *)bookTypeImage:(BookStatus)status {
	UIImage *bookTypeImage = [UIImage imageNamed:@"search_blue-btn-nor"];
	if (status == kBookStatusBorrowed) {
		bookTypeImage = [UIImage imageNamed:@"search_red-btn-nor"];
	}
	return bookTypeImage;
}

- (UIImage *)bookTypeSelectImage:(BookStatus)status {
	UIImage *bookTypeSelectImage = [UIImage imageNamed:@"search_blue-btn-chose"];
	if (status == kBookStatusBorrowed) {
		bookTypeSelectImage = [UIImage imageNamed:@"search_red-btn-chose"];
	}
	return bookTypeSelectImage;
}

@end
