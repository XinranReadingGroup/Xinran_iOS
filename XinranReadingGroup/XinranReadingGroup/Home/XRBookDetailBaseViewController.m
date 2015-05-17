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
#import "XRBookDetailInfoCell.h"
#import "XRBookDetailDonatorCell.h"
#import "XRBookDetailPublisherCell.h"
#import "XRBookDetailContentCell.h"
#import <UIViewController+ZYCore.h>

@interface XRBookDetailBaseViewController () <UITableViewDelegate,UITableViewDataSource>

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
	
//    [self registerCell];

	[self.biz fetchBookDetail: ^{
	    [self.tableView reloadData];
	} failure: ^(NSError *error) {
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
	[self.tableView registerClass:[XRBookDetailInfoCell class] forCellReuseIdentifier:@"XRBookDetailInfoCell"];
	[self.tableView registerClass:[XRBookDetailContentCell class] forCellReuseIdentifier:@"XRBookDetailContentCell"];
	[self.tableView registerClass:[XRBookDetailPublisherCell class] forCellReuseIdentifier:@"XRBookDetailPublisherCell"];
	[self.tableView registerClass:[XRBookDetailDonatorCell class] forCellReuseIdentifier:@"XRBookDetailDonatorCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 24;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.section) {
		case 0:
		{
			return [XRBookDetailInfoCell cellHeight];
		}
		break;
		
		case 1:
		{
			return [XRBookDetailContentCell cellHeight:self.biz.bookData];
		}
		break;
		
		case 2:
		{
			return [XRBookDetailPublisherCell cellHeight];
		}
		break;
		
		case 3:
		{
			return [XRBookDetailDonatorCell cellHeight];
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
	switch (indexPath.section) {
		case 0:
		{
			XRBookDetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XRBookDetailInfoCell" forIndexPath:indexPath];
			cell.data = self.biz.bookData;
			return cell;
		}
		break;
		
		case 1:
		{
			XRBookDetailContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XRBookDetailContentCell" forIndexPath:indexPath];
			cell.data = self.biz.bookData;
			return cell;
		}
		break;
		
		case 2:
		{
			XRBookDetailPublisherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XRBookDetailPublisherCell" forIndexPath:indexPath];
			cell.data = self.biz.bookData;
			return cell;
		}
		break;
		
		case 3:
		{
			XRBookDetailDonatorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XRBookDetailDonatorCell" forIndexPath:indexPath];
			cell.data = self.biz.bookData;
			return cell;
		}
		break;
		
		default:
		{
			UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
			return cell;
		}
		break;
	}
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
