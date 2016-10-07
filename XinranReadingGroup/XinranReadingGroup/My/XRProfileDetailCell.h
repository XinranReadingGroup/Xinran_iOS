//
//  XRProfileDetailCell.h
//  XinranReadingGroup
//
//  Created by peichuang on 16/10/6.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreTableViewCell.h>

typedef enum : NSUInteger {
    ProfileDetailTypeAvatar,
    ProfileDetailTypeNickName,
    ProfileDetailTypePassword,
    ProfileDetailTypeLocation,
    ProfileDetailTypeIntroduction,
} ProfileDetailType;

@interface XRProfileDetailCell : ZYCoreTableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *detailImageView;
@property (nonatomic, strong) UILabel *detailLabel;

+ (CGFloat)cellHeightForType:(ProfileDetailType)type;

@end
