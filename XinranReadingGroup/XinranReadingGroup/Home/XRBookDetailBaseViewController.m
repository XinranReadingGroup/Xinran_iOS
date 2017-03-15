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
#import <ZYCoreDefine.h>
#import "XRBookRecordEntity.h"
#import "XRBookDetailEntity.h"
#import "XRBookDetailHeaderView.h"
#import "SVProgressHUD.h"
#import "XRBorrowBookQRViewController.h"
#import "XRBookDetailLocationCell.h"
#import "XRBookDetailEntity.h"
#import "XRBookRecordEntity.h"
#import "XRBookDetailLocationEntity.h"

@interface XRBookDetailBaseViewController () <UITableViewDelegate, UITableViewDataSource>

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

- (void)setBookData:(XRBookDetailEntity *)bookData {
	_bookData = bookData;
	self.biz.bookData = bookData;
}

- (XRBookDetailEntity *)bookData {
	return self.biz.bookData;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	self.title = self.bookData.book.title;

	[self updateBorrowButton];
	
	self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 63, 0);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [SVProgressHUD showWithStatus:LOCALSTRING(@"书籍信息获取中")];
    [self.biz fetchBookDetail: ^{
        [self.tableView reloadData];
        [self updateBorrowButton];
        [SVProgressHUD dismiss];
    } failure: ^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - borrow button
- (void)updateBorrowButton {
	if (self.biz.bookData.onOffStockRecord.borrowStatus == kBookStatusAvaliable) {
		self.borrowButton.enabled = YES;
		if (self.biz.bookData.onOffStockRecord.bookType == kBookTypeBorrow) {
			[self.borrowButton setTitle:LOCALSTRING(@"扫码借阅") forState:UIControlStateNormal];
		}
		else {
			[self.borrowButton setTitle:LOCALSTRING(@"我想借") forState:UIControlStateNormal];
		}
	}
	else {
		self.borrowButton.enabled = NO;
		[self.borrowButton setTitle:LOCALSTRING(@"已被借") forState:UIControlStateNormal];
	}
}

- (IBAction)borrowButtonTapped:(UIButton *)sender {
	if (self.biz.bookData.onOffStockRecord.bookType == kBookTypeBorrow) {
		//借书
        XRBorrowBookQRViewController *qrViewController = [[XRBorrowBookQRViewController alloc] init];
        qrViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:qrViewController animated:YES];
	}
}

+ (NSArray *)sectionTitles {
    return @[@"位置",@"内容简介",@"出版信息",@"捐书人"];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
	return 24;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
	return [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [[UIView alloc] initWithFrame:CGRectZero];
    }
    else {
        XRBookDetailHeaderView *bookDetailHeaderView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XRBookDetailHeaderView class]) owner:nil options:nil].lastObject;
        bookDetailHeaderView.sectionTitle.text = [[self class] sectionTitles][section - 1];
        return bookDetailHeaderView;
    }
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
            return 50;
        }
            break;
		
		case 2:
		{
			return [XRBookDetailContentCell cellHeight:self.biz.bookData];
		}
		break;
		
		case 3:
		{
			return [XRBookDetailPublisherCell cellHeight];
		}
		break;
		
		case 4:
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
            return @"位置";
        }
            break;
		
		case 2:
		{
			return @"内容简介";
		}
		break;
		
		case 3:
		{
			return @"出版信息";
		}
		break;
		
		case 4:
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
            XRBookDetailLocationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XRBookDetailLocationCell" forIndexPath:indexPath];
            cell.location = self.biz.bookData.bookLocationVO.locationString;
            return cell;
        }
            break;
            
		case 2:
		{
			XRBookDetailContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XRBookDetailContentCell" forIndexPath:indexPath];
			cell.data = self.biz.bookData;
			return cell;
		}
		break;
		
		case 3:
		{
			XRBookDetailPublisherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XRBookDetailPublisherCell" forIndexPath:indexPath];
			cell.data = self.biz.bookData.book;
			return cell;
		}
		break;
		
		case 4:
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

@end
