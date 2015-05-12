//
//  XRBookDetailBaseViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/5/6.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRBookDetailBaseViewController.h"
#import "XRBookDetailBiz.h"
#import <UIImageView+WebCache.h>
#import "XRBookEntity.h"
#import <UIView+ZYCore.h>

@interface XRBookDetailBaseViewController ()

@property (nonatomic, strong) XRBookDetailBiz *biz;
@property (weak, nonatomic) IBOutlet UIImageView *bookCover;
@property (weak, nonatomic) IBOutlet UILabel *bookTitle;
@property (weak, nonatomic) IBOutlet UILabel *bookCase;
@property (weak, nonatomic) IBOutlet UITextView *bookContent;
@property (weak, nonatomic) IBOutlet UITextView *publisherInfo;
@property (weak, nonatomic) IBOutlet UIImageView *donatorAvatar;
@property (weak, nonatomic) IBOutlet UILabel *donatorName;
@property (weak, nonatomic) IBOutlet UILabel *donateDate;

@end

@implementation XRBookDetailBaseViewController

@synthesize bookData = _bookData;

- (XRBookDetailBiz *)biz {
    if (!_biz) {
        _biz = [[XRBookDetailBiz alloc] init];
    }
    return _biz;
}

- (void)setBookData:(XRBookEntity *)bookData {
    _bookData = bookData;
    self.biz.bookData = bookData;
}

- (XRBookEntity *)bookData {
    return self.biz.bookData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCell];
    
    [self.biz fetchBookDetail:^{
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        //TODO 获取书籍信息失败处理
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerCell {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"bookInfo"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"content"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"publisherInfo"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"donatorInfo"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            return 184;
        }
            break;
        case 1:
        {
            return [self contentInfoHeight];
        }
            break;
        case 2:
        {
            return 162;
        }
            break;
        case 3:
        {
            return 77;
        }
            break;
            
        default:
            return 0;
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
        {
            return nil;
        }
            break;
        case 1:
        {
            return @"内容简介";
        }
            break;
        case 2:
        {
            return @"出版信息";
        }
            break;
        case 3:
        {
            return @"捐书人";
        }
            break;
            
        default:
            return @"";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"bookInfo" forIndexPath:indexPath];
            [self.bookCover sd_setImageWithURL:[NSURL URLWithString:self.biz.bookData.imgURL]];
            self.bookTitle.text = self.biz.bookData.title;
            self.bookCase.text = self.biz.bookData.bookcase;
        }
            break;
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"content" forIndexPath:indexPath];
            self.bookContent.text = self.biz.bookData.summary;
        }
            break;
        case 2:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"publisherInfo" forIndexPath:indexPath];
            self.publisherInfo.text = [self publisherInfoText];
        }
            break;
        case 3:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"donatorInfo" forIndexPath:indexPath];
            self.donatorName.text = self.biz.bookData.donator;
            [self.donatorAvatar sd_setImageWithURL:[NSURL URLWithString:@"http://fd.topitme.com/d/8b/d4/1187454768482d48bdo.jpg"]];
            self.donateDate.text = @"2015-5-11";
        }
            break;
        default:
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            break;
    }
    
    
    return cell;
}

- (NSString *)publisherInfoText {
    NSMutableString *publisherInfo = [NSMutableString string];
    NSArray *titles = @[@"作 者",@"出版社",@"出版年",@"页 数",@"定 价",@"装 帧",@"ISBN码"];
    NSArray *values = @[self.bookData.author?self.bookData.author:@"",self.bookData.publisher?self.bookData.publisher:@"",@"",@"",@"",@"",self.bookData.isbn?self.bookData.isbn:@""];
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

- (CGFloat)contentInfoHeight {
    CGSize textSize = [self.biz.bookData.summary sizeWithFont:self.bookContent.font forWidth:self.bookContent.width lineBreakMode:NSLineBreakByWordWrapping];
    return textSize.height;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
