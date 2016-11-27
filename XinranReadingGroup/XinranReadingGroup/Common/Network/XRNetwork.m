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
//#import "XRNetworkErrorAssistant.h"

static NSString *const defaultXRBaseURL = @"http://www.xinrandushuba.com/mobile";
static NSString *const defaultTestBaseURL = @"http://10.18.219.152/mobile";
static NSString *const defaultDoubanBaseURL = @"";
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
}

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
}

- (NSString *)urlWithMethodName:(NSString *)methodName {
	if (![methodName hasPrefix:@"/"] && methodName && methodName.length > 0) {
		methodName = [NSString stringWithFormat:@"/%@", methodName];
	}
	return [[NSString stringWithFormat:@"%@%@", self.baseURL, methodName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (void)GET:(NSString *)methodName param:(NSDictionary *)param withEntityName:(NSString *)entityName success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
	[self GET:methodName param:param success: ^(id param) {
	    NSError *error;
	    XREntity *entity = [[NSClassFromString(entityName) alloc] initWithDictionary:[param objectForKey:@"data"] error:&error];
	    if (error) {
	        DLog(@"映射json时出错：\n%@", error.description);
		}
        if (success) {
            if (entity) {
                success(entity);
            }
            else {
                success([param valueForKey:@"data"]);
            }
        }
	} failure:failure];
}

- (void)GET:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	[manager GET:[self urlWithMethodName:methodName] parameters:param success: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    DLog(@"--------------------------------------------------\n请求成功~~~~~~~~~~~~~\nurl: \n%@ \n返回数据:\n%@\n--------------------------------------------------", operation.request.URL.absoluteString, responseObject);
		if ([self isRequestSuccess:responseObject]) {
			if (success) {
				success(responseObject);
			}
		}
		else {
            //[XRNetworkErrorAssistant handleErrorFromServer:responseObject];
            NSInteger code = [responseObject valueForKey:@"code"] ? [[responseObject valueForKey:@"code"] integerValue] : 0;
            NSError *error = [NSError errorWithDomain:operation.request.URL.host code:code userInfo:
                              @{KEY_NETWORK_ERROR_MESSAGE:
                                    [responseObject valueForKey:@"data"] ? [responseObject valueForKey:@"data"] : @""}];
            if (failure) {
                failure(error);
            }
		}
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    DLog(@"--------------------------------------------------\n请求失败!!!!!!!!!!!!!!\nurl: \n%@\nerror: \n%@\n--------------------------------------------------", operation.request.URL.absoluteString, error.description);
		//[XRNetworkErrorAssistant handleNetworkFailure:error];
		if (failure) {
            failure(error);
		}
	}];
}

- (void)POST:(NSString *)methodName param:(NSDictionary *)param success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	[manager POST:[self urlWithMethodName:methodName] parameters:param success: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    DLog(@"--------------------------------------------------\n请求成功~~~~~~~~~~~~~\nurl: \n%@ \n返回数据:\n%@\n--------------------------------------------------", operation.request.URL.absoluteString, responseObject);
		if ([self isRequestSuccess:responseObject]) {
			if (success) {
				success(responseObject);
			}
		}
		else {
            //[XRNetworkErrorAssistant handleErrorFromServer:responseObject];
            NSInteger code = [responseObject valueForKey:@"code"] ? [[responseObject valueForKey:@"code"] integerValue] : 0;
            NSError *error = [NSError errorWithDomain:operation.request.URL.host code:code userInfo:
                              @{KEY_NETWORK_ERROR_MESSAGE:
                                    [responseObject valueForKey:@"data"] ? [responseObject valueForKey:@"data"] : @""}];
            if (failure) {
                failure(error);
            }
		}
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    DLog(@"--------------------------------------------------\n请求失败!!!!!!!!!!!!!!\nurl: \n%@\nerror: \n%@\n--------------------------------------------------", operation.request.URL.absoluteString, error.description);
		//[XRNetworkErrorAssistant handleNetworkFailure:error];
	    if (failure) {
	        failure(error);
		}
	}];
}

- (BOOL)isRequestSuccess:(id)result {
	//如果返回200就是成功
	if ([result valueForKey:@"code"] && [[result valueForKey:@"code"] integerValue] == 200) {
		return YES;
	}
	return NO;
}

@end
