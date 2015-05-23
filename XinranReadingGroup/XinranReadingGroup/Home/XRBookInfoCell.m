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

@implementation XRBookInfoCell

- (void)setBookData:(XRBookEntity *)bookData {
    _bookData = bookData;
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
    [self.bookCover sd_setImageWithURL:[NSURL URLWithString:self.bookData.imgURL]];
    self.bookTitle.text = self.bookData.title;
    self.bookDetail.text = [self bookDetailText];
}

- (NSString *)bookDetailText {
    NSMutableString *bookDetail = [NSMutableString string];
    NSArray *titles = @[@"",@"捐书人",@""];
//    NSArray *
    return bookDetail;
}

@end
