//
//  XRProfileDetailCell.m
//  XinranReadingGroup
//
//  Created by peichuang on 16/10/6.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRProfileDetailCell.h"
#import "ZYCoreCellInfo.h"

#import <Masonry.h>
#import <ZYCoreFramework/ZYCoreDefine.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation XRProfileDetailCell

+ (CGFloat)cellHeightForType:(ProfileDetailType)type
{
    if (type == ProfileDetailTypeAvatar) {
        return 110;
    }
    return 50;
}

- (void)setupUI
{
    __weak XRProfileDetailCell *wSelf = self;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = RGBACOLOR(75, 75, 75, 1);
    self.titleLabel.text = @"测试标题";
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(wSelf.contentView.mas_leading).with.offset(15);
        make.centerY.equalTo(wSelf.contentView.mas_centerY);
    }];
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.font = [UIFont systemFontOfSize:15];
    self.detailLabel.textColor = RGBACOLOR(140, 140, 140, 1);
    self.detailLabel.text = @"测试文本";
    [self.contentView addSubview:self.detailLabel];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(wSelf.titleLabel.mas_centerY);
        make.trailing.equalTo(wSelf.contentView.mas_trailing).with.offset(0);
    }];
    
    self.detailImageView = [[UIImageView alloc] init];
    self.detailImageView.layer.cornerRadius = 40;
    self.detailImageView.layer.masksToBounds = YES;
    [self.detailImageView sd_setImageWithURL:[NSURL URLWithString:@"http://7xn9af.com1.z0.glb.clouddn.com/default_avatar@2x.png"] placeholderImage:[UIImage imageNamed:@"default_avatar"] options:SDWebImageRefreshCached];
    [self.contentView addSubview:self.detailImageView];
    
    [self.detailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(wSelf.titleLabel.mas_centerY);
        make.trailing.equalTo(wSelf.contentView.mas_trailing).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
}

- (void)updateUI
{
    ProfileDetailType type = [self.data[@"type"] integerValue];
    self.titleLabel.text = [XRProfileDetailCell titleForType:type];
    if (type == ProfileDetailTypeAvatar) {
        self.detailImageView.hidden = NO;
        self.detailLabel.hidden = YES;
    } else if (type == ProfileDetailTypePassword) {
        self.detailImageView.hidden = YES;
        self.detailLabel.hidden = YES;
    } else {
        self.detailImageView.hidden = YES;
        self.detailLabel.hidden = NO;
    }
}

+ (NSString *)titleForType:(ProfileDetailType)type
{
    NSString *title = @"";
    switch (type) {
        case ProfileDetailTypeAvatar:
            title = @"头像";
            break;
        case ProfileDetailTypeLocation:
            title = @"地区";
            break;
        case ProfileDetailTypeNickName:
            title = @"笔名";
            break;
        case ProfileDetailTypePassword:
            title = @"修改密码";
            break;
        case ProfileDetailTypeIntroduction:
            title = @"个性签名";
            break;
        default:
            break;
    }
    return title;
}

@end
