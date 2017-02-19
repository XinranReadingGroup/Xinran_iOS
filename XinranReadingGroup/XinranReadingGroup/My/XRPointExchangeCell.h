//
//  XRPointExchangeCell.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/11/25.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreTableViewCell.h>

@interface XRPointExchangeCell : ZYCoreTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *activityImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end
