//
// Created by dreamer on 15/11/23.
// Copyright (c) 2015 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XRTools : NSObject

+ (void)popToTop;

+ (void)showLoginViewController;

+ (void)showTabbarViewController:(UIViewController *)currentViewController animated:(BOOL)animated;

+ (UIViewController *)loginViewController;

@end