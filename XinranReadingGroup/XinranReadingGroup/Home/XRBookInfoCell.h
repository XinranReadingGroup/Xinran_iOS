//
//  XRBookInfoCell.h
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/21.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XRBookDetailEntity;

@interface XRBookInfoCell : UITableViewCell

@property (nonatomic, strong) XRBookDetailEntity *bookData;
@property (weak, nonatomic) IBOutlet UIImageView *bookCover;
@property (weak, nonatomic) IBOutlet UILabel *bookTitle;
@property (weak, nonatomic) IBOutlet UILabel *bookDetail;

+ (CGFloat)cellHeight;

@end
