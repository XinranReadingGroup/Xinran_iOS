//
//  XRSearchListCell.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/19.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XRBookEntity;

@interface XRSearchListCell : UITableViewCell

@property (nonatomic, weak) XRBookEntity *data;
@property (weak, nonatomic) IBOutlet UIImageView *cover;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIButton *type;
@property (weak, nonatomic) IBOutlet UITextView *detail;

@end
