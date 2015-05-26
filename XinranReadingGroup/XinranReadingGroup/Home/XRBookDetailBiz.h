//
//  XRBookDetailBiz.h
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/6.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZYBlockDefine.h>

@class XRBookDetailEntity;

@interface XRBookDetailBiz : NSObject

@property (nonatomic, strong) XRBookDetailEntity *bookData;

- (void)fetchBookDetail:(ZYBlock)success failure:(ZYErrorBlock)failure;

- (void)borrowBook:(ZYBlock)success failure:(ZYErrorBlock)failure;

@end
