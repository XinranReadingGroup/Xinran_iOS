//
//  XRActivityEntity.h
//  XinranReadingGroup
//
//  Created by peichuang on 17/2/19.
//  Copyright © 2017年 SnowWolf. All rights reserved.
//

#import "XREntity.h"

@interface XRActivityEntity : XREntity

@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *endDate;
@property (nonatomic, copy) NSString *activityId;
@property (nonatomic, copy) NSString *imgId;
@property (nonatomic, copy) NSString *memo;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *startDate;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *updatedAt;


@end
