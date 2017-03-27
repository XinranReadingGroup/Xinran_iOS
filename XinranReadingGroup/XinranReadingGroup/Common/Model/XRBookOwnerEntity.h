//
//  XRBookOwnerEntity.h
//  XinranReadingGroup
//
//  Created by dreamer on 16/2/3.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XREntity.h"

@interface XRBookOwnerEntity : XREntity

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *imgId;
@property (nonatomic, copy) NSURL *avatarURL;

@end
