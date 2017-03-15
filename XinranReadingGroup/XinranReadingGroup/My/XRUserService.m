//
//  XRUserService.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/5.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRUserService.h"
#import "XRBookListEntity.h"
#import "XRActivityEntity.h"
#import "XRActivityListEntity.h"
#import <CocoaLumberjack.h>
//test
#import <ZYCoreFramework/ZYCoreDefine.h>
#import <AFNetworking.h>
#import "XRNetwork+Token.h"
#import "XRUser.h"
#import "XRUserProfile.h"
//test end

@implementation XRUserService

+ (void)fetchDonateRecord:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [[XRNetwork sharedXRNetwork] GETWithToken:@"book/donate/records" param:nil withEntityName:nil success:^(id param) {
        if (param) {
            //对传过来的array进行处理
            NSDictionary * const result = @{@"bookList":param};
            NSError *error;
            XRBookListEntity *listEntity = [[XRBookListEntity alloc] initWithDictionary:result error:&error];
            if (!error) {
                if (success) {
                    success(listEntity);
                }
            }
            else {
                success(param);
            }
        }
    } failure:failure];
}

+ (void)fetchShareBook:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [[XRNetwork sharedXRNetwork] GETWithToken:@"book/share/records" param:nil withEntityName:nil success:^(id param) {
        if (param) {
            //对传过来的array进行处理
            NSDictionary * const result = @{@"bookList":param};
            NSError *error;
            XRBookListEntity *listEntity = [[XRBookListEntity alloc] initWithDictionary:result error:&error];
            if (!error) {
                if (success) {
                    success(listEntity);
                }
            }
            else {
                success(param);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)fetchBorrowBookWithPath:(NSString *)path success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [[XRNetwork sharedXRNetwork] GETWithToken:path param:nil withEntityName:nil success:^(id param) {
        if (param) {
            //对传过来的array进行处理
            NSDictionary * const result = @{@"bookList":param};
            NSError *error;
            XRBookListEntity *listEntity = [[XRBookListEntity alloc] initWithDictionary:result error:&error];
            if (!error) {
                if (success) {
                    success(listEntity);
                }
            }
            else {
                success(param);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)fetchActivity:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [[XRNetwork sharedXRNetwork] GETWithToken:@"activities" param:@{@"status":@"available",@"pageSize":@"10000",@"pageNo":@"1"} withEntityName:nil success:^(id param) {
        id activitys = param[@"activities"];
        
        //对传过来的array进行处理
        NSDictionary * const result = @{@"activityList":activitys};
        NSError *error;
        XRActivityListEntity *listEntity = [[XRActivityListEntity alloc] initWithDictionary:result error:&error];
        if (!error) {
            if (success) {
                success(listEntity);
            }
        }
        else {
            success(param);
        }
    } failure:failure];
}

+ (void)fetchUserProfile:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    [[XRNetwork sharedXRNetwork] GETWithToken:@"user/profile" param:nil withEntityName:nil success:success failure:failure];
}

+ (void)updateUserProfile:(XRUserProfile *)profile success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    NSString *token = [NSString stringWithFormat:@"user/profile"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (profile.nickName) {
        [dict setObject:profile.nickName forKey:@"nickName"];
    }
    if (profile.signature) {
        [dict setObject:profile.signature forKey:@"signature"];
    }
    
    [[XRNetwork sharedXRNetwork] POSTWithToken:token param:dict success:success failure:failure];
}

+ (void)uploadPhotoWith:(NSData *)data success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure
{
    NSString *token = @"upload";
    [[XRNetwork sharedXRNetwork] POST:token param:nil data:data success:success failure:failure];
}

+ (void)convertActivity:(NSString *)activityId success:(ZYObjectBlock)success failure:(ZYErrorBlock)failure {
    NSString *token = [NSString stringWithFormat:@"activity/convert/%@", activityId];
    [[XRNetwork sharedXRNetwork] POSTWithToken:token param:nil success:success failure:failure];
}

@end
