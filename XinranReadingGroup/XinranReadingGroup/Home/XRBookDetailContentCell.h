//
//  XRBookDetailContentCell.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XRBookEntity;
@class XRBookDetailEntity;

@interface XRBookDetailContentCell : UITableViewCell

@property (nonatomic, strong) XRBookDetailEntity *data;
@property (weak, nonatomic) IBOutlet UITextView *content;

+ (CGFloat)cellHeight:(XRBookDetailEntity *)data;

@end
