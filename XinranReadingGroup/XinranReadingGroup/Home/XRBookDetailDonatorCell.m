//
//  XRBookDetailDonatorCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookDetailDonatorCell.h"
#import "XRBookRecordEntity.h"
#import <UIImageView+WebCache.h>
#import <NSNumber+ZYCore.h>

@implementation XRBookDetailDonatorCell

- (void)setData:(XRBookRecordEntity *)data {
	_data = data;
	[_donatorAvatar sd_setImageWithURL:[NSURL URLWithString:@"http://fd.topitme.com/d/8b/d4/1187454768482d48bdo.jpg"]];
	_donatorName.text = _data.ownerUserId.stringValue;
	_donateDate.text = [_data.onStockDate toDefaultDataString];
}

- (void)awakeFromNib {
	// Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

+ (CGFloat)cellHeight {
	return 77;
}

@end
