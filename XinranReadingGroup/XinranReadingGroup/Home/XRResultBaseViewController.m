//
//  XRResultBaseViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/5/21.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRResultBaseViewController.h"

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

#pragma mark - UITableView Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

@end
