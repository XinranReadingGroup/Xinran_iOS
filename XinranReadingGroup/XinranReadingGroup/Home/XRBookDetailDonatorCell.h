//
//  XRBookDetailDonatorCell.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XRBookRecordEntity;

@interface XRBookDetailDonatorCell : UITableViewCell

@property (nonatomic, strong) XRBookRecordEntity *data;
@property (weak, nonatomic) IBOutlet UIImageView *donatorAvatar;
@property (weak, nonatomic) IBOutlet UILabel *donatorName;
@property (weak, nonatomic) IBOutlet UILabel *donateDate;

+ (CGFloat)cellHeight;

@end
