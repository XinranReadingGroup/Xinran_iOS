//
//  XRBookDetailInfoCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookDetailInfoCell.h"
#import "XRBookEntity.h"
#import <UIImageView+WebCache.h>

@implementation XRBookDetailInfoCell

- (void)setData:(XRBookEntity *)data {
    _data = data;
    [self.bookCover sd_setImageWithURL:[NSURL URLWithString:self.data.imgURL]];
    self.bookTitle.text = _data.title;
    self.bookCase.text = _data.bookcase;
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
    [self.bookCover sd_setImageWithURL:[NSURL URLWithString:self.data.imgURL]];
    self.bookTitle.text = _data.title;
    self.bookCase.text = _data.bookcase;
}

+ (CGFloat)cellHeight {
    return 184;
}

@end
