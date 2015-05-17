//
//  XRBookDetailPublisherCell.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XRBookEntity;

@interface XRBookDetailPublisherCell : UITableViewCell

@property (nonatomic, strong) XRBookEntity *data;
@property (weak, nonatomic) IBOutlet UITextView *publisherInfo;

+ (CGFloat)cellHeight;

@end
