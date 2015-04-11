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

@implementation XRBookService

+ (void)fetchSearchResult:(NSString *)keyword success:(ZYDictionaryBlock)success failure:(ZYErrorBlock)failure {
    if (!keyword) {
        failure(nil);
    }
    [[XRNetwork sharedXRNetwork] GET:@"search" param:@{@"q":keyword} success:^(id param) {
        if (success) {
            success(param);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)donateBook:(NSString *)ISBN success:(ZYDictionaryBlock)success failure:(ZYErrorBlock)failure {
    [[self class] uploadBook:ISBN type:kBookTypeBorrow success:success failure:failure];
}

+ (void)shareBook:(NSString *)ISBN success:(ZYDictionaryBlock)success failure:(ZYErrorBlock)failure {
    [[self class] uploadBook:ISBN type:kBookTypeShare success:success failure:failure];
}

+ (void)uploadBook:(NSString *)ISBN type:(BookType)type success:(ZYDictionaryBlock)success failure:(ZYErrorBlock)failure {
    if (!ISBN) {
        failure(nil);
    }
    [[XRNetwork sharedXRNetwork] GET:@"book" param:@{@"isbn":ISBN,@"type":[NSNumber numberWithInt:type]} success:^(id param) {
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
    }
    [[XRNetwork sharedXRNetwork] GET:@"book/borrow" param:@{@"id":bookId} success:^(id param) {
        if (success) {
            success(param);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)returnBook:(NSString *)bookId success:(ZYBlock)success failure:(ZYErrorBlock)failure {
    if (!bookId) {
        failure(nil);
    }
    [[XRNetwork sharedXRNetwork] GET:@"book/return" param:@{@"id":bookId} success:^(id param) {
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
