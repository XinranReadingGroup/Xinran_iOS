//
//  XRSearchViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/19.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRSearchViewController.h"
#import <ZYCoreDefine.h>
#import <UIView+ZYCore.h>
#import <UIViewController+navigationBarItem.h>
#import "XRSearchBiz.h"
#import "XRBookListEntity.h"
#import "XRSearchListCell.h"
#import <UIViewController+ZYCore.h>
#import "XRBookDetailBaseViewController.h"
#import <UIViewController+ZYCore.h>
#import <ZYCoreDefine.h>

@interface XRSearchViewController () <UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) XRSearchBiz *biz;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation XRSearchViewController

- (XRSearchBiz *)biz {
    if (!_biz) {
        _biz = [[XRSearchBiz alloc] init];
    }
    return _biz;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSearchBar];
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark - UI
- (void)addSearchBar {
    if (self.searchBar) {
        return;
    }
    [self.navigationItem setHidesBackButton:YES];
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width - 10, self.navigationController.navigationBar.height)];
    self.searchBar.delegate = self;
    self.searchBar.showsCancelButton = YES;
    [self.searchBar setBackgroundImage:[UIImage new]];
    [self.searchBar setTranslucent:YES];
    [self.searchBar becomeFirstResponder];
    
    //cancel按钮
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    
    UIView *titleView = [[UIView alloc] initWithFrame:self.searchBar.frame];
    [titleView addSubview:self.searchBar];
    self.navigationItem.titleView = titleView;
}

- (void)initTableView {
    self.tableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
}

#pragma mark - SearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    //清空上一次的搜索结果
    self.biz.bookList = [[XRBookListEntity alloc] init];
    [self.tableView reloadData];
    
    NSString *keyword = searchBar.text;
    [self.biz fetchSearchResult:keyword success:^{
        if (self.biz.bookList.bookList.count > 0) {
            self.tableView.hidden = NO;
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        //TODO 搜索失败
    }];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.navigationController popViewControllerAnimated:NO];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    self.tableView.hidden = YES;
    return YES;
}

#pragma mark - UITableView Delegate & DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.biz.bookList.bookList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XRSearchListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XRSearchListCell"];
    cell.data = self.biz.bookList.bookList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XRBookEntity *bookEntity = self.biz.bookList.bookList[indexPath.row];
    XRBookDetailBaseViewController *detailViewController = (XRBookDetailBaseViewController *)[UIViewController viewControllerWithIdentifer:@"XRBookDetailBaseViewController" withStoryboardName:@"Main"];
    detailViewController.bookData = bookEntity;
    [self.navigationController pushViewController:detailViewController animated:YES];
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
