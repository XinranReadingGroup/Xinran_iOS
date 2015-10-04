//
//  XRResultBaseViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/21.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRResultBaseViewController.h"
#import "XRBookInfoCell.h"
#import <UIView+ZYCore.h>
#import <ZYCoreDefine.h>

@interface XRResultBaseViewController () <UITableViewDelegate, UITableViewDataSource>


@end

@implementation XRResultBaseViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
	{
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
}

- (void)update {
	if (!self.tableView) {
		[self addTableView];
	}
	self.tableView.tableHeaderView = [self headerView];
	[self.tableView reloadData];
}

- (void)addTableView {
	self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
	[self.view addSubview:self.tableView];
	self.tableView.delegate = self;
	self.tableView.backgroundColor = RGBCOLOR(242, 242, 242);
	self.tableView.dataSource = self;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - UI
- (UIView *)headerView {
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.width, 180)];
	
	UIView *containterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
	[headerView addSubview:containterView];
	
	UIImageView *successIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_red-btn-chose"]];
	[containterView addSubview:successIcon];
	
	UILabel *result = [[UILabel alloc] init];
	result.text = self.resultText;
	result.font = [UIFont boldSystemFontOfSize:20.];
	[result sizeToFit];
	result.left = successIcon.right + 10;
	[containterView addSubview:result];
	
	UILabel *notice = [[UILabel alloc] init];
	notice.text = self.noticeText;
	notice.font = [UIFont systemFontOfSize:16.];
	[notice sizeToFit];
	notice.left = result.left;
	notice.top = result.bottom + 5;
	[containterView addSubview:notice];
	
	CGFloat containerWidth = notice.right > result.right ? notice.right : result.right;
	CGFloat containerHeight = successIcon.height > notice.bottom - result.top ? successIcon.height : notice.bottom - successIcon.top;
	containterView.width = containerWidth;
	containterView.height = containerHeight;
	
	containterView.centerX = headerView.width / 2;
	containterView.centerY = headerView.height / 2;
	
	result.top = (containterView.height - (notice.bottom - result.top)) / 2;
	notice.top = result.bottom + 5;
	
	return headerView;
}

#pragma mark - UITableView Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [XRBookInfoCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	XRBookInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XRBookInfoCell"];
	if (!cell) {
		cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XRBookInfoCell class]) owner:nil options:nil].lastObject;
	}
	cell.bookData = self.bookData;
	return cell;
}

@end
