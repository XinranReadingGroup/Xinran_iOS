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
    [self startAnimation];
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
    [UIView animateWithDuration:1 animations:^{
        self.registerButton.alpha = 1;
        self.signButton.alpha = 1;
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
