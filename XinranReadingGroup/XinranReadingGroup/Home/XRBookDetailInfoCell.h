//
//  XRBookDetailInfoCell.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XRBookDetailEntity;

@interface XRBookDetailInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bookCover;
@property (weak, nonatomic) IBOutlet UILabel *bookTitle;
@property (weak, nonatomic) IBOutlet UILabel *bookCase;

@property (nonatomic, strong) XRBookDetailEntity *data;

+ (CGFloat)cellHeight;

@end
