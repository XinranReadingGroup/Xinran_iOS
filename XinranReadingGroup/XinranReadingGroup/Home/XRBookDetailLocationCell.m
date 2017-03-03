//
//  XRBookDetailLocationCell.m
//  XinranReadingGroup
//
//  Created by Du on 03/03/2017.
//  Copyright © 2017 SnowWolf. All rights reserved.
//

#import "XRBookDetailLocationCell.h"

@interface XRBookDetailLocationCell ()

@property (weak, nonatomic) IBOutlet UITextView *locationTextView;

@end

@implementation XRBookDetailLocationCell

- (void)setLocation:(NSString *)location {
    _location = location;
    self.locationTextView.text = location;
}

+ (CGFloat)cellHeightWithLocation:(NSString *)location {
    return 44;
}

@end
