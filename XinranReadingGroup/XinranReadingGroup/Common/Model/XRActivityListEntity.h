//
//  XRActivityListEntity.h
//  XinranReadingGroup
//
//  Created by peichuang on 17/2/19.
//  Copyright © 2017年 SnowWolf. All rights reserved.
//

#import "XREntity.h"
#import "XRActivityEntity.h"

@interface XRActivityListEntity : XREntity

@property (nonatomic, strong) NSArray <XRActivityEntity *>* activityList;

@end
