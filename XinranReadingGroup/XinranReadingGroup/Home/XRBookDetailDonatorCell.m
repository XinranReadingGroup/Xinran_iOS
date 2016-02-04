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
#import "XRBookOwnerEntity.h"
#import "XRBookDetailEntity.h"

@implementation XRBookDetailDonatorCell

- (void)setData:(XRBookDetailEntity *)data {
    _data = data;
    [self updateUI];
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

- (void)updateUI {
	//TODO 用户图片的信息也木有
	[_donatorAvatar sd_setImageWithURL:[NSURL URLWithString:@"http://fd.topitme.com/d/8b/d4/1187454768482d48bdo.jpg"]];
//	[_donatorAvatar sd_setImageWithURL:[NSURL URLWithString:self.data.offStockDate.]]
	_donatorName.text = self.data.ownerUserVO.nickName;
	//TODO 日期数据还没有
	_donateDate.text = [self.data.onOffStockRecord.onStockDate toDefaultDataString];

}

@end
