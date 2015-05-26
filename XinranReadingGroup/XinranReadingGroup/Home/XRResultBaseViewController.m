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

@interface XRResultBaseViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XRResultBaseViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)addTableView {
	self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
	[self.view addSubview:self.tableView];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
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
	[result sizeToFit];
	result.left = successIcon.right + 5;
	[containterView addSubview:result];
    
    UILabel *notice = [[UILabel alloc] init];
    notice.text = self.noticeText;
    [notice sizeToFit];
    [containterView addSubview:notice];
	
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
