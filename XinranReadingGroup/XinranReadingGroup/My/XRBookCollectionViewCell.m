//
//  XRBookCollectionViewCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/18.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRBookCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "XRBookDetailEntity.h"
#import "XRBookEntity.h"
#import "View+MASAdditions.h"

@interface XRBookCollectionViewCell ()

@property (strong, nonatomic) UIImageView *bookCover;
@property (strong, nonatomic) UILabel *bookTitle;

@end

@implementation XRBookCollectionViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupUI];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }

    return self;
}


- (void)setupUI {
    __weak XRBookCollectionViewCell *weakSelf = self;
    self.bookCover = [[UIImageView alloc] init];
    [self.contentView addSubview:self.bookCover];
    [self.bookCover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf);
        make.leading.equalTo(weakSelf.contentView);
        make.trailing.equalTo(weakSelf.contentView);
        make.height.mas_equalTo(@100);
    }];

    self.bookTitle = [[UILabel alloc] init];
    self.bookTitle.font = [UIFont systemFontOfSize:12.];
    self.bookTitle.numberOfLines = 0;
    [self.contentView addSubview:self.bookTitle];
    [self.bookTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.bookCover.mas_bottom).offset(5);
        make.leading.equalTo(weakSelf.contentView);
        make.trailing.equalTo(weakSelf.contentView);
        make.bottom.equalTo(weakSelf.contentView);
    }];
}


- (void)setData:(XRBookDetailEntity *)data {
    _data = data;
    [self reloadData];
}

- (void)reloadData {
    [self.bookCover sd_setImageWithURL:[NSURL URLWithString:self.data.book.imgURL]];
    self.bookTitle.text = self.data.book.title;
}

@end
