//
//  XRFeedbackViewController.m
//  XinranReadingGroup
//
//  Created by peichuang on 16/11/27.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRFeedbackViewController.h"
#import "UIViewController+navigationBarItem.h"

#import "ZYCoreDefine.h"
#import "SVProgressHUD.h"
#import <UMFeedback.h>

@interface XRFeedbackViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation XRFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"意见反馈";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setRightBarItemWithString:LOCALSTRING(@"提交") target:self action:@selector(saveAction)];
    self.textView.layer.borderWidth = 1;
    self.textView.layer.borderColor = [UIColor colorWithWhite:235/255.0 alpha:1].CGColor;
    [self.textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveAction
{
    NSString *text = [self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([@"" isEqualToString:text]) {
        [SVProgressHUD showWithStatus:@"请输入内容"];
        return;
    }
    NSDictionary *dict = @{@"feedback": text};
    [SVProgressHUD showWithStatus:LOCALSTRING(@"正在提交中...")];
    __weak XRFeedbackViewController *wSelf = self;
    [[UMFeedback sharedInstance] post:dict completion:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showSuccessWithStatus:LOCALSTRING(@"提交成功")];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                [wSelf.navigationController popViewControllerAnimated:YES];
            });
        });
    }];
}

@end
