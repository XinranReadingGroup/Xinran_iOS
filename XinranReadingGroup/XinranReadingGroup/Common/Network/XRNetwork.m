//
//  XRNetwork.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/8.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRNetwork.h"
#import <ZYCoreDefine.h>
#import <AFNetworking.h>

static NSString * const defaultXRBaseURL = @"http://www.xinrandushuba.com/mobile";
static NSString * const defaultDoubanBaseURL = @"";

@implementation XRNetwork

+ (XRNetwork *)sharedXRNetwork {
    static XRNetwork *sharedXRNetwork;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedXRNetwork = [[XRNetwork alloc] init];
        if (sharedXRNetwork) {
            sharedXRNetwork.baseURL = defaultXRBaseURL;
        }
    });
    
    return sharedXRNetwork;
};

+ (XRNetwork *)sharedDoubanNetwork {
    static XRNetwork *sharedDoubanNetwork;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDoubanNetwork = [[XRNetwork alloc] init];
        if (sharedDoubanNetwork) {
            sharedDoubanNetwork.baseURL = defaultDoubanBaseURL;
        }
    });
    
    return sharedDoubanNetwork;
};

- (NSString *)urlWithMethodName:(NSString *)methodName {
    if (![methodName hasPrefix:@"/"]) {
        methodName = [NSString stringWithFormat:@"/%@",methodName];
    }
    return [NSString stringWithFormat:@"%@%@",self.baseURL,methodName];
}

- (void)GET:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[self urlWithMethodName:methodName] parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)POST:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:[self urlWithMethodName:methodName] parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
