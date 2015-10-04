//
//  UIButton+XRButton.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/9/26.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/UIView+ZYCore.h>
#import "UIButton+XRButton.h"
#import "UIButton+AFNetworking.h"
#import "ZYCoreDefine.h"

static CGFloat defaultButtonFont = 16;

@implementation UIButton (XRButton)

+ (UIButton *)blueRoundedRectButtonWithTitle:(NSString *)title {
    UIButton *button = [UIButton roundedRecButtonWithTitle:title];
    [button setBackgroundColor:RGBCOLOR(1, 197, 223)];
    return button;
}

+ (UIButton *)redRoundedRectButtonWithTitle:(NSString *)title {
    UIButton *button = [UIButton roundedRecButtonWithTitle:title];
    [button setBackgroundColor:RGBCOLOR(236, 112, 112)];
    return button;
}

+ (UIButton *)roundedRecButtonWithTitle:(NSString *)title {
    NSString *notNilTitle = title ? title : @"";
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:notNilTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:defaultButtonFont];
    CGSize textSize = [notNilTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:defaultButtonFont]}];
    button.height = textSize.height + 14;
    button.width = textSize.width + button.height;
    button.layer.cornerRadius = button.height / 2;
    return button;
}

@end
