//
//  XRMyProfileCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/5.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/ZYCoreDefine.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "XRMyProfileCell.h"
#import "XRUser.h"
#import "OAStackView.h"
#import "XRUserProfile.h"
#import <Masonry.h>

@implementation XRMyProfileCell

- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UIImageView *avatar = [[UIImageView alloc] init];
    self.avatarImageView = avatar;
    [avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@60);
        make.height.mas_equalTo(@60);
    }];
    avatar.layer.cornerRadius = 30;
    avatar.layer.masksToBounds = YES;
    
    if ([XRUser sharedXRUser].profile.imgId) {
        [avatar sd_setImageWithURL:[NSURL URLWithString:[XRUser sharedXRUser].profile.imgId]];
    }
    else {
        [avatar sd_setImageWithURL:[NSURL URLWithString:[XRUser sharedXRUser].profile.avatarUrl] placeholderImage:[UIImage imageNamed:@"default_avatar"] options:SDWebImageRefreshCached];
    }
    UILabel *IDText = [[UILabel alloc] init];
    self.nickLabel = IDText;
    [IDText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@60);
    }];
    IDText.text = [XRUser sharedXRUser].profile.nickName;
    OAStackView *stackView = [[OAStackView alloc] initWithArrangedSubviews:@[avatar,IDText]];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = OAStackViewAlignmentLeading;
    stackView.spacing = 15;
    [self.contentView addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.centerY.mas_equalTo(UIEdgeInsetsMake(10, 15, 10, 15));
        make.edges.equalTo(self.contentView).offset(15);
    }];
}

- (void)updateUI
{
    if ([XRUser sharedXRUser].profile.imgId) {
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:[XRUser sharedXRUser].profile.imgId]];
    }
    else {
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:[XRUser sharedXRUser].profile.avatarUrl] placeholderImage:[UIImage imageNamed:@"default_avatar"] options:SDWebImageRefreshCached];
    }
    self.nickLabel.text = [XRUser sharedXRUser].profile.nickName;
}

@end
