//
//  XRBookDetailPublisherCell.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookDetailPublisherCell.h"
#import "XRBookEntity.h"

@implementation XRBookDetailPublisherCell

- (void)setData:(XRBookEntity *)data {
    _data = data;
    _publisherInfo.text = [self publisherInfoText];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSString *)publisherInfoText {
    NSMutableString *publisherInfo = [NSMutableString string];
    NSArray *titles = @[@"作 者",@"出版社",@"出版年",@"页 数",@"定 价",@"装 帧",@"ISBN码"];
    NSArray *values = @[_data.author?_data.author:@"",_data.publisher?_data.publisher:@"",@"",@"",@"",@"",_data.isbn?_data.isbn:@""];
    if (titles.count != values.count) {
        return @"";
    }
    [titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *title = obj;
        NSString *value = values[idx];
        [publisherInfo appendFormat:@"%@：%@\n",title,value];
    }];
    if (publisherInfo.length > 0) {
        //去掉最后一个换行符
        [publisherInfo deleteCharactersInRange:NSMakeRange(publisherInfo.length - 1, 1)];
    }
    return [NSString stringWithString:publisherInfo];
}

+ (CGFloat)cellHeight {
    return 77;
}

@end
