//
//  XRBookDetailDonatorCell.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XRBookDetailEntity;

@interface XRBookDetailDonatorCell : UITableViewCell

@property (nonatomic, strong) XRBookDetailEntity *data;
@property (weak, nonatomic) IBOutlet UIImageView *donatorAvatar;
@property (weak, nonatomic) IBOutlet UILabel *donatorName;
@property (weak, nonatomic) IBOutlet UILabel *donateDate;

+ (CGFloat)cellHeight;
- (void)updateUI;

@end
