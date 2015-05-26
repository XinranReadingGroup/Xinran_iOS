//
//  XRBookDetailInfoCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookDetailInfoCell.h"
#import "XRBookDetailEntity.h"
#import "XRBookRecordEntity.h"
#import "XRBookEntity.h"
#import <UIImageView+WebCache.h>

@implementation XRBookDetailInfoCell

- (void)setData:(XRBookDetailEntity *)data {
	_data = data;
	[self.bookCover sd_setImageWithURL:[NSURL URLWithString:self.data.book.imgURL]];
	self.bookTitle.text = _data.book.title;
	self.bookCase.text = _data.onOffStockRecord.locationName;
}

- (void)awakeFromNib {
	// Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

- (void)layoutSubviews {
	[super layoutSubviews];
	[self.bookCover sd_setImageWithURL:[NSURL URLWithString:self.data.book.imgURL]];
	self.bookTitle.text = _data.book.title;
	self.bookCase.text = _data.onOffStockRecord.locationName;
}

+ (CGFloat)cellHeight {
	return 184;
}

@end
