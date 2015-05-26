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

- (void)awakeFromNib {
	// Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

- (void)reloadCell {
	self.title.text = self.data.book.title;
	self.detail.text = [self jointDetail];
	[self.type setTitle:[self bookType:self.data.onOffStockRecord.bookType] forState:UIControlStateNormal];
	[self.type setTitle:[self bookType:self.data.onOffStockRecord.bookType] forState:UIControlStateSelected];
	[self.type setTitle:[self bookType:self.data.onOffStockRecord.bookType] forState:UIControlStateHighlighted];
	[self.type setBackgroundImage:[self bookTypeImage:self.data.onOffStockRecord.bookType] forState:UIControlStateNormal];
	[self.type setBackgroundImage:[self bookTypeSelectImage:self.data.onOffStockRecord.bookType] forState:UIControlStateSelected];
	[self.type setBackgroundImage:[self bookTypeSelectImage:self.data.onOffStockRecord.bookType] forState:UIControlStateHighlighted];
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

- (NSString *)bookType:(BookType)type {
	NSString *bookType = @"";
	
	switch (type) {
		case kBookTypeBorrow:
		{
			bookType = LOCALSTRING(@"借阅");
		}
		break;
		
		case kBookTypeShare:
		{
			bookType = LOCALSTRING(@"共享");
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

- (UIImage *)bookTypeImage:(BookType)type {
	UIImage *bookTypeImage = [UIImage imageNamed:@"search_blue-btn-nor"];
	if (type == kBookTypeShare) {
		bookTypeImage = [UIImage imageNamed:@"search_red-btn-nor"];
	}
	return bookTypeImage;
}

- (UIImage *)bookTypeSelectImage:(BookType)type {
	UIImage *bookTypeSelectImage = [UIImage imageNamed:@"search_blue-btn-chose"];
	if (type == kBookTypeShare) {
		bookTypeSelectImage = [UIImage imageNamed:@"search_red-btn-chose"];
	}
	return bookTypeSelectImage;
}

@end
