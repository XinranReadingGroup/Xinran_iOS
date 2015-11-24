//
//  XRBorrowRecordCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/11/23.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import <ZYCoreFramework/ZYCoreDefine.h>
#import "XRBorrowRecordCell.h"
#import "XRBookDetailEntity.h"
#import "XRBookEntity.h"
#import "XRBookRecordEntity.h"

@interface XRBorrowRecordCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bookCover;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *publisher;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIButton *bookStatus;
@property (weak, nonatomic) IBOutlet UIView *whiteBackground;

@end

@implementation XRBorrowRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.whiteBackground.layer.masksToBounds = NO;
    self.whiteBackground.layer.shadowColor = RGBCOLOR(218,218,218).CGColor;
//    self.whiteBackground.layer.shadowColor = RGBCOLOR(0,0,0).CGColor;
    self.whiteBackground.layer.shadowOffset = CGSizeMake(0,1);
}


- (void)updateUI {
    [super updateUI];
    XRBookDetailEntity *detailEntity = (XRBookDetailEntity *)self.data;
    [self.bookCover sd_setImageWithURL:[NSURL URLWithString:detailEntity.book.imgURL]];
    self.title.text = detailEntity.book.title;
    self.publisher.text = detailEntity.book.publisher;
    self.address.text = [NSString stringWithFormat:@"%@",detailEntity.onOffStockRecord.location];
    [self updateStatusButtonWithStatus:detailEntity.onOffStockRecord.borrowStatus];
}

- (void)updateStatusButtonWithStatus:(BookStatus)status {
    self.bookStatus.hidden = NO;
    if (status == kBookStatusBorrowed) {
        self.bookStatus.backgroundColor = RGBCOLOR(235,97,0);
        [self.bookStatus setTitle:LOCALSTRING(@"未还") forState:UIControlStateNormal];
    }
    else if (status == kBookStatusAvaliable) {
        self.bookStatus.backgroundColor = RGBCOLOR(89,195,24);
        [self.bookStatus setTitle:LOCALSTRING(@"已还") forState:UIControlStateNormal];
    }
    else {
        self.bookStatus.hidden = YES;
    }
}

@end