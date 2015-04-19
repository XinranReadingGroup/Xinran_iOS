//
//  XRShareAssistant.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/16.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UMSocialControllerService.h"

@interface XRShareAssistant : NSObject <UMSocialUIDelegate>

+ (void)setup;

- (void)showShareSheet:(UIViewController *)target;

@end
