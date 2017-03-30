//
//  XRSetupAssistant.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/16.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRSetupAssistant.h"
#import "XRShareAssistant.h"
#import "SVProgressHUD.h"
#import "XRNetwork.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import <JSPatchPlatform/JSPatch.h>

@implementation XRSetupAssistant

+ (void)setup {
    //JSPatch
    [JSPatch startWithAppKey:@"db0ec829a4b36936"];
    [JSPatch setupRSAPublicKey:@"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDMhl7LxZImfhcm4TBIEwYA0cv/\nikLm4DAl9+0HdGqH/aPTNNSrRbVnn9FLFSXGca9lkdPSzINCFwB6IMmuA+fhTJXD\n4BvuDO+8mVLJkNLqJ5KmKD3Qf3PM4Mxf1i6Q6+KdidlSB4B9ax635ong9S6rffXa\n2srcq7YPGWqRLAyIrQIDAQAB\n-----END PUBLIC KEY-----"];
    [JSPatch sync];
    
    [XRNetwork sharedXRNetwork].baseImageUrlString = @"http://www.xinrandushuba.com";
    [XRShareAssistant setup];
    [[self class] setupNavigationBar];
    [[self class] setupCocoaLumberjack];
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    
    //crash 日志
    [Fabric with:@[[Crashlytics class]]];
}

+ (void)setupNavigationBar {
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_navigationbar"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
}

+ (void)setupCocoaLumberjack {
    static DDLogLevel ddLogLevel;
#if DEBUG
    ddLogLevel = DDLogLevelVerbose;
#else
    ddLogLevel = DDLogLevelWarning;
#endif
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:ddLogLevel];
    [DDLog addLogger:[DDASLLogger sharedInstance] withLevel:ddLogLevel];

    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
}

@end
