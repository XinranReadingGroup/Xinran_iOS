//
//  XRProfileEditViewController.m
//  XinranReadingGroup
//
//  Created by peichuang on 16/11/27.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRProfileEditViewController.h"
#import "XRProfileDetailCell.h"
#import "UIViewController+navigationBarItem.h"

#import "ZYCoreDefine.h"

@interface XRProfileEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *lineImageViewArray;

@end

@implementation XRProfileEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setRightBarItemWithString:LOCALSTRING(@"保存") target:self action:@selector(saveAction)];

    [self.firstTextField becomeFirstResponder];
    ProfileDetailType type = [[self.cellData objectForKey:@"type"] integerValue];
    if (type == ProfileDetailTypePassword) {
        self.firstTextField.hidden = NO;
        self.secondTextField.hidden = NO;
        [self.lineImageViewArray setValue:@(NO) forKey:@"hidden"];
    } else if (type == ProfileDetailTypeNickName || type == ProfileDetailTypeIntroduction) {
        self.firstTextField.hidden = NO;
        self.secondTextField.hidden = YES;
        [self.lineImageViewArray[0] setValue:@(NO) forKey:@"hidden"];
        [self.lineImageViewArray[1] setValue:@(YES) forKey:@"hidden"];
    } else {
        self.firstTextField.hidden = YES;
        self.secondTextField.hidden = YES;
        [self.lineImageViewArray setValue:@(YES) forKey:@"hidden"];
    }
    [self setupView];
}

- (void)saveAction
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView
{
    ProfileDetailType type = [[self.cellData objectForKey:@"type"] integerValue];
    switch (type) {
        case ProfileDetailTypeNickName:
            self.firstTextField.placeholder = @"昵称修改";
            self.firstTextField.secureTextEntry = NO;
            self.title = @"昵称修改";
            break;
        case ProfileDetailTypePassword:
            self.firstTextField.placeholder = @"旧密码";
            self.firstTextField.secureTextEntry = YES;
            self.secondTextField.placeholder = @"新密码";
            self.secondTextField.secureTextEntry = YES;
            self.title = @"密码修改";
            break;
        case ProfileDetailTypeIntroduction:
            self.firstTextField.placeholder = @"个人签名";
            self.firstTextField.secureTextEntry = NO;
            self.title = @"个人签名";
            break;
        default:
            break;
    }
}

@end
