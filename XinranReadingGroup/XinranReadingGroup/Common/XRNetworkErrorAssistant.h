//
// Created by dreamer on 15/11/25.
// Copyright (c) 2015 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XRNetworkErrorAssistant : NSObject
+ (void)handleErrorFromServer:(id)responseObject;

+ (void)handleNetworkFailure:(NSError *)error;
@end