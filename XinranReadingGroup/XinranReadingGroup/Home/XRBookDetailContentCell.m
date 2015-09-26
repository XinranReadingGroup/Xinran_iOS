//
//  XRBookDetailContentCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookDetailContentCell.h"
#import "XRBookDetailEntity.h"
#import "XRBookEntity.h"
#import <ZYCoreDefine.h>

@implementation XRBookDetailContentCell

- (void)setData:(XRBookDetailEntity *)data {
	_data = data;
	_content.text = _data.book.summary;
}

- (void)awakeFromNib {
	// Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

+ (CGFloat)cellHeight:(XRBookDetailEntity *)data {
    CGSize textSize = CGSizeZero;
//    if (data && data.book.summary) {
        textSize = [data.book.summary boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 95, MAXFLOAT) options:(NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin) attributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:14.] } context:NULL].size;
//    }
	return textSize.height;
}

@end
