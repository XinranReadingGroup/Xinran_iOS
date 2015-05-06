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
#import "XREntity.h"

static NSString * const defaultXRBaseURL = @"http://xinrandushuba.com/mobile";
static NSString * const defaultTestBaseURL= @"http://10.16.225.38:8080/mobile";
static NSString * const defaultDoubanBaseURL = @"";
static BOOL const isTest = NO;

@implementation XRNetwork

+ (XRNetwork *)sharedXRNetwork {
    static XRNetwork *sharedXRNetwork;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedXRNetwork = [[XRNetwork alloc] init];
        if (sharedXRNetwork) {
            sharedXRNetwork.baseURL = isTest ? defaultTestBaseURL : defaultXRBaseURL;
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
    if (![methodName hasPrefix:@"/"] && methodName && methodName.length > 0) {
        methodName = [NSString stringWithFormat:@"/%@",methodName];
    }
    return [NSString stringWithFormat:@"%@%@",self.baseURL,methodName];
}

- (void)GET:(NSString *)methodName param:(NSDictionary *)param withEntityName:(NSString *)entityName success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [self GET:methodName param:param success:^(id param) {
        NSError *error;
        XREntity *entity = [[NSClassFromString(entityName) alloc] initWithDictionary:[param objectForKey:@"data"] error:&error];
        if (!error) {
            if (success) {
                success(entity);
            }
        }
        else {
            failure(nil);
        }
    } failure:failure];
}

- (void)GET:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[self urlWithMethodName:methodName] parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"get request success. url is %@, response is %@",operation.request.URL.absoluteString,responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"get request fail. url is %@",operation.request.URL.absoluteString);
        failure(error);
    }];
}

- (void)POST:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:[self urlWithMethodName:methodName] parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"post request success. url is %@, response is %@",operation.request.URL.absoluteString,responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"post request fail. url is %@",operation.request.URL.absoluteString);
        if (failure) {
            failure(error);
        }
    }];
}

@end
