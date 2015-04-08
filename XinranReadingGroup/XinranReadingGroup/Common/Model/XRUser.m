//
//  XRUser.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/8.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRUser.h"

@implementation XRUser

RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[RKTweet class]];
[mapping addAttributeMappingsFromDictionary:@{
                                              @"user.name":   @"username",
                                              @"user.id":     @"userID",
                                              @"text":        @"text"
                                              }];

RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:nil];
NSURL *url = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/public_timeline.json"];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
[operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
    NSLog(@"The public timeline Tweets: %@", [result array]);
} failure:nil];
[operation start];

@end
