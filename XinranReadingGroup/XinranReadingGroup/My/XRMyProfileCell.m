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
#import <Masonry.h>

@implementation XRMyProfileCell

- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UIImageView *avatar = [[UIImageView alloc] init];
    [avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@60);
        make.height.mas_equalTo(@60);
    }];
    //TODO 头像还没有地方可以获取
    [avatar sd_setImageWithURL:[NSURL URLWithString:@"http://www.wmpic.me/wp-content/uploads/2014/06/20140611171618736.jpeg"]];
    UILabel *IDText = [[UILabel alloc] init];
    __weak UILabel *weakIDText = IDText;
    [IDText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@60);
    }];
    IDText.text = [XRUser sharedXRUser].userIdentifier;
    OAStackView *stackView = [[OAStackView alloc] initWithArrangedSubviews:@[avatar,IDText]];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = OAStackViewAlignmentLeading;
    stackView.spacing = 15;
    [self.contentView addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(UIEdgeInsetsMake(10, 15, 10, 15));
        make.edges.equalTo(self.contentView).offset(15);
    }];
}

@end
