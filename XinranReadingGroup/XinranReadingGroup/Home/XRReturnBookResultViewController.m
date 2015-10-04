//
//  XRReturnBookResultViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/8/6.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>
#import <ZYCoreFramework/ZYCoreDefine.h>
#import "XRReturnBookResultViewController.h"
#import "XRBookService.h"
#import "XRBookDetailEntity.h"
#import "XRBookRecordEntity.h"

@interface XRReturnBookResultViewController ()

@end

@implementation XRReturnBookResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LOCALSTRING(@"还书结果");
    [self returnBook];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)returnBook {
    [SVProgressHUD showWithStatus:LOCALSTRING(@"书籍借阅中，稍安勿躁哟")];
    [XRBookService returnBook:self.bookData.onOffStockRecord.bookID success: ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        //借书成功
        self.resultText = LOCALSTRING(@"归还成功");
        self.noticeText = LOCALSTRING(@"请将书籍放回到书架哟");
        [self update];
    } failure: ^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        //借书失败
        self.resultText = LOCALSTRING(@"归还失败");
        self.noticeText = LOCALSTRING(@"返回重试一下吧");
        [self update];
    }];
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
