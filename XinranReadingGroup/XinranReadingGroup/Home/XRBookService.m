//
//  XRBookService.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/11.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookService.h"
#import "XRNetwork.h"
#import "XRBookEntity.h"
#import "XRBookListEntity.h"
#import "XRUser.h"
#import "XRBookRecordEntity.h"

@implementation XRBookService

+ (void)fetchSearchResult:(NSString *)keyword startPage:(NSInteger)startPage pageSize:(NSInteger)pageSize success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    if (!keyword) {
        failure(nil);
        return;
    }

    [[XRNetwork sharedXRNetwork] GET:@"book/search" param:@{@"q":keyword} withEntityName:NSStringFromClass([XRBookListEntity class]) success:^(id param) {
        if (success) {
            success(param);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)donateBook:(NSString *)bookId QRCode:(NSString *)QRCode locationID:(NSNumber *)locationID success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [[self class] uploadBook:bookId QRCode:(NSString *)QRCode locationID:(NSNumber *)locationID methodName:@"donate" success:success failure:failure];
}

+ (void)shareBookBookId:(NSString *)bookId QRCode:(NSString *)QRCode locationID:(NSNumber *)locationID success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [[self class] uploadBook:bookId QRCode:(NSString *)QRCode locationID:(NSNumber *)locationID methodName:@"share" success:success failure:failure];
}

+ (void)uploadBook:(NSString *)bookId QRCode:(NSString *)QRCode locationID:(NSNumber *)locationID methodName:(NSString *)methodName success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    if (!bookId) {
        failure(nil);
        return;
    }
    NSString *url = [NSString stringWithFormat:@"book/%@/%@",methodName,bookId];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:[XRUser sharedXRUser].accessToken forKey:@"accessToken"];
    [param setValue:QRCode forKey:@"qrCode"];
    [param setValue:locationID forKey:@"locationId"];
    
    [[XRNetwork sharedXRNetwork] GET:url param:param withEntityName:NSStringFromClass([XRBookRecordEntity class]) success:^(id param) {
        if (success) {
            success(param);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)borrowBook:(NSString *)bookId success:(ZYBlock)success failure:(ZYErrorBlock)failure {
	if (!bookId) {
		failure(nil);
		return;
	}
	NSString *url = [NSString stringWithFormat:@"book/borrow/%@", bookId];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:[XRUser sharedXRUser].accessToken forKey:@"accessToken"];
	[[XRNetwork sharedXRNetwork] GET:url param:param success: ^(id param) {
	    if (success) {
	        success(param);
		}
	} failure: ^(NSError *error) {
	    if (failure) {
	        failure(error);
		}
	}];
}

+ (void)returnBook:(NSString *)bookId success:(ZYBlock)success failure:(ZYErrorBlock)failure {
	if (!bookId) {
		failure(nil);
	}
	NSString *url = [NSString stringWithFormat:@"book/return/%@", bookId];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:[XRUser sharedXRUser].accessToken forKey:@"accessToken"];
	[[XRNetwork sharedXRNetwork] GET:url param:param success: ^(id param) {
	    if (success) {
	        success(param);
		}
	} failure: ^(NSError *error) {
	    if (failure) {
	        failure(error);
		}
	}];
}

+ (void)bookDetailWithISBN:(NSString *)ISBN success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    if (!ISBN) {
        failure(nil);
        return;
    }
    NSString *methodName = [NSString stringWithFormat:@"book/isbn/%@",ISBN];
    [[XRNetwork sharedXRNetwork] GET:methodName param:nil withEntityName:NSStringFromClass([XRBookEntity class]) success:^(id param) {
        if (success) {
            success(param);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)bookDetailWithBookID:(NSString *)bookID success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    if (!bookID) {
        failure(nil);
        return;
    }
    NSString *methodName = [NSString stringWithFormat:@"book/detail/%@",bookID];
    [[XRNetwork sharedXRNetwork] GET:methodName param:nil withEntityName:NSStringFromClass([XRBookDetailEntity class]) success:^(id param) {
        if (success) {
            success(param);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
