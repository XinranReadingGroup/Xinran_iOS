//
//  XRUserService.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/10/5.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRUserService.h"
#import "XRNetwork.h"
#import "XRBookListEntity.h"
//test
#import <ZYCoreFramework/ZYCoreDefine.h>
#import <AFNetworking.h>
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

@end
