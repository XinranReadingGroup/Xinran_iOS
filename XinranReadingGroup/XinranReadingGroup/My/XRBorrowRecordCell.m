//
//  XRBorrowRecordCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/11/23.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "XRBorrowRecordCell.h"
#import "XRBookDetailEntity.h"
#import "XRBookEntity.h"
#import "XRBookRecordEntity.h"

@interface XRBorrowRecordCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bookCover;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *publisher;
@property (weak, nonatomic) IBOutlet UILabel *address;


@end

@implementation XRBorrowRecordCell

- (void)setData:(id)data {
    _data = data;
    [self updateUI];
}

- (void)updateUI {
//    [super updateUI];
    XRBookDetailEntity *detailEntity = (XRBookDetailEntity *)self.data;
    [self.bookCover sd_setImageWithURL:[NSURL URLWithString:detailEntity.book.imgURL]];
    self.title.text = detailEntity.book.title;
    self.publisher.text = detailEntity.book.publisher;
    self.address.text = [NSString stringWithFormat:@"%@",detailEntity.onOffStockRecord.location];
}


@end