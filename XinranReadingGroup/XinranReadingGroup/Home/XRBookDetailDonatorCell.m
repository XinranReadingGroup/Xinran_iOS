//
//  XRBookDetailDonatorCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookDetailDonatorCell.h"
#import "XRBookRecordEntity.h"
#import "UIImageView+WebCache.h"
#import "NSNumber+ZYCore.h"
#import "XRBookOwnerEntity.h"
#import "XRBookDetailEntity.h"

@implementation XRBookDetailDonatorCell

- (void)setData:(XRBookDetailEntity *)data {
    _data = data;
    [self updateUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

+ (CGFloat)cellHeight {
	return 77;
}

- (void)updateUI {
    [_donatorAvatar sd_setImageWithURL:self.data.ownerUserVO.avatarURL];
	_donatorName.text = self.data.ownerUserVO.nickName;
	_donateDate.text = [self.data.onOffStockRecord.onStockDate toDefaultDataString];

}

@end
