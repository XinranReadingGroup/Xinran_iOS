//
//  UIButton+XRButton.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/9/26.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  实现统一样式的button
 */
@interface UIButton (XRButton)

+ (UIButton *)blueRoundedRectButtonWithTitle:(NSString *)title;

+ (UIButton *)redRoundedRectButtonWithTitle:(NSString *)title;

+ (UIButton *)roundedRecButtonWithTitle:(NSString *)title;
@end
