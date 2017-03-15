//
//  XRPointExchangeCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/11/25.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import "XRPointExchangeCell.h"
#import "XRActivityEntity.h"
#import "XRUserService.h"

#import "UIImageView+WebCache.h"
#import "NSString+URLEncode.h"
#import <SVProgressHUD.h>

@implementation XRPointExchangeCell

- (void)updateUI
{
    NSDictionary *activity = self.data;
    NSString *url = [NSString stringWithFormat:@"http://xinrandushuba.com/%@", [activity[@"imgId"] URLEncode]];
    [self.activityImageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"default_avatar"] options:SDWebImageRefreshCached];
    self.titleLabel.text = activity[@"title"];
    self.scoreLabel.text = [NSString stringWithFormat:@"%@积分", activity[@"score"]];
}
- (IBAction)doneAction:(id)sender {
    [XRUserService convertActivity:self.data[@"id"] success:^(id param) {
        [SVProgressHUD showSuccessWithStatus:@"兑换成功"];
        [[NSNotificationCenter defaultCenter] postNotificationName:XRMemberPointRefreshNotification object:nil];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"兑换失败"];
    }];
}

@end
