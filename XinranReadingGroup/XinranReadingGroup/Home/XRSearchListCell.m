
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

@implementation XRSearchListCell

- (void)setData:(XRBookEntity *)data {
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
    self.title.text = self.data.title;
    self.detail.text = [self jointDetail];
    [self.type setTitle:[self bookType:self.data.type] forState:UIControlStateNormal];
    [self.type setBackgroundImage:[self bookTypeImage:self.data.type] forState:UIControlStateNormal];
    [self.type setBackgroundImage:[self bookTypeSelectImage:self.data.type] forState:UIControlStateSelected];
    [self.type setBackgroundImage:[self bookTypeSelectImage:self.data.type] forState:UIControlStateHighlighted];
}

- (NSString *)jointDetail {
    //封面
    [self.cover sd_setImageWithURL:[NSURL URLWithString:self.data.imgURL]];
    //作者、出版社
    NSMutableString *detailString = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%@/%@",self.data.author,self.data.publisher]];
    //捐书人
    if (self.data.donator) {
        [detailString appendString:[NSString stringWithFormat:@"\n捐书人 %@",self.data.donator]];
    }
    //书架
    if (self.data.bookcase) {
        [detailString appendString:self.data.bookcase];
    }
    
    return detailString;
}

- (NSString *)bookType:(BookType)type {
    NSString *bookType = @"";
    
    switch(type) {
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
