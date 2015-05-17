//
//  XRBookDetailDonatorCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookDetailDonatorCell.h"
#import "XRBookEntity.h"
#import <UIImageView+WebCache.h>

@implementation XRBookDetailDonatorCell

- (void)setData:(XRBookEntity *)data {
    _data = data;
    [_donatorAvatar sd_setImageWithURL:[NSURL URLWithString:@"http://fd.topitme.com/d/8b/d4/1187454768482d48bdo.jpg"]];
    _donatorName.text = _data.donator;
    _donateDate.text = @"2015-6-1";
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
