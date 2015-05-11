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

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            return 184;
        }
            break;
        case 1:
        {
            return 0;
        }
            break;
        case 2:
        {
            return 0;
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
            self.publisherInfo.text = self.biz.bookData.publisher;
        }
            break;
        case 3:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"donatorInfo" forIndexPath:indexPath];
        }
            break;
        default:
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            break;
    }
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
