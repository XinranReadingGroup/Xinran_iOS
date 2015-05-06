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

@implementation XRBookService

+ (void)fetchSearchResult:(NSString *)keyword startPage:(NSInteger)startPage pageSize:(NSInteger)pageSize success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    if (!keyword) {
        failure(nil);
        return;
    }
    //for test
    [[XRNetwork sharedXRNetwork] GET:@"" param:nil withEntityName:NSStringFromClass([XRBookListEntity class]) success:^(id param) {
        if (success) {
            success(param);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return;
    //test end
    
    
    [[XRNetwork sharedXRNetwork] GET:@"search" param:@{@"q":keyword,@"startPage":[NSNumber numberWithInteger:startPage],@"pageSize":[NSNumber numberWithInteger:pageSize]} withEntityName:NSStringFromClass([XRBookListEntity class]) success:^(id param) {
        if (success) {
            success(param);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)donateBook:(NSString *)bookId success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [[self class] uploadBook:bookId methodName:@"donate" success:success failure:failure];
}

+ (void)shareBook:(NSString *)bookId success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [[self class] uploadBook:bookId methodName:@"share" success:success failure:failure];
}

+ (void)uploadBook:(NSString *)bookId methodName:(NSString *)methodName success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    if (!bookId) {
        failure(nil);
        return;
    }
    NSString *url = [NSString stringWithFormat:@"book/%@/%@",methodName,bookId];
    [[XRNetwork sharedXRNetwork] GET:url param:nil withEntityName:NSStringFromClass([XRBookEntity class]) success:^(id param) {
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

+ (void)bookDetail:(NSString *)ISBN success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
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

+ (NSDictionary *)mockSearchResult {
    NSString *mockSearchResultString = @"{\
                                            \"code\": 200,\
                                            \"data\":\
                                            {\
                                                \"list\":\
                                                [\
                                                 {\
                                                     \"id\": 1,\
                                                     \"createdAt\": 1428763706074,\
                                                     \"updatedAt\": 1428763706074,\
                                                     \"isbn\": \"9787550244146\",\
                                                     \"title\": \"罗辑思维：成大事者不纠结\",\
                                                     \"imgURL\": \"http://img3.douban.com/mpic/s28016051.jpg\",\
                                                     \"author\": \"罗振宇\",\
                                                     \"summary\": \"【编辑推荐】\n1、罗振宇，自媒体视频脱口秀《罗辑思维》主讲人，互联网知识型社群试水者，资深媒体人和传播专家。曾任CCTV《经济与法》《对话》制片人等。2012年底打造知识型视频脱口秀《罗辑思维》...\",\
                                                     \"price\": \"42.00元\",\
                                                     \"publisher\": \"北京联合出版公司\"\
                                                 },\
                                                 {\
                                                     \"id\": 1,\
                                                     \"createdAt\": 1428763706074,\
                                                     \"updatedAt\": 1428763706074,\
                                                     \"isbn\": \"9787550244146\",\
                                                     \"title\": \"罗辑思维：成大事者不纠结\",\
                                                     \"imgURL\": \"http://img3.douban.com/mpic/s28016051.jpg\",\
                                                     \"author\": \"罗振宇\",\
                                                     \"summary\": \"【编辑推荐】\n1、罗振宇，自媒体视频脱口秀《罗辑思维》主讲人，互联网知识型社群试水者，资深媒体人和传播专家。曾任CCTV《经济与法》《对话》制片人等。2012年底打造知识型视频脱口秀《罗辑思维》...\",\
                                                     \"price\": \"42.00元\",\
                                                     \"publisher\": \"北京联合出版公司\"\
                                                 }\
                                                 ]\
                                            }\
                                            \"desc\": null\
                                        }";
    NSDictionary *mockDic;
    return mockDic;
}

@end
