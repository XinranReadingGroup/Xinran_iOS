//
//  XRLoginWelcomeViewController.m
//  XinranReadingGroup
//
//  Created by Xiao Du on 15/4/7.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "XRLoginWelcomeViewController.h"
#import "XRUser.h"
#import <UIViewController+ZYCore.h>
#import <Masonry/View+MASAdditions.h>

@interface XRLoginWelcomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *signButton;
@property (weak, nonatomic) IBOutlet UIStackView *buttonStackView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconStackViewCenterY;
@property (weak, nonatomic) IBOutlet UIImageView *iconText;

@end

@implementation XRLoginWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupButtons];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:0.5];
}


- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)setupButtons {
    self.registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.registerButton.layer.borderWidth = 1;
    self.registerButton.layer.cornerRadius = 20;
    self.registerButton.alpha = 0;

    self.signButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.signButton.layer.borderWidth = 1;
    self.signButton.layer.cornerRadius = 20;
    self.signButton.alpha = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startAnimation {
    [UIView animateWithDuration:0.5 animations:^{
        self.iconText.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.iconText.alpha = 1;
            //改变图片
            self.iconText.image = [UIImage imageNamed:@"welcome_text"];
        } completion:nil];
    }];
    
    
    [UIView animateWithDuration:1.5 animations:^{
        //按钮渐现
        self.registerButton.alpha = 1;
        self.signButton.alpha = 1;
        
        //图标上移
        self.iconStackViewCenterY.constant -= 120;
        [self.view layoutIfNeeded];
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
