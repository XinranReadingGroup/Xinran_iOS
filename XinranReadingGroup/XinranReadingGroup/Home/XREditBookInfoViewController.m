//
//  XREditBookInfoViewController.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/9/29.
//  Copyright © 2015年 SnowWolf. All rights reserved.
//

#import <ZYCoreFramework/UIViewController+navigationBarItem.h>
#import <ZYCoreFramework/ZYCoreDefine.h>
#import <ZYCoreFramework/NSString+ZYCore.h>
#import "XREditBookInfoViewController.h"
#import "UIButton+WebCache.h"
#import "XRBookEntity.h"
#import "XRBookService.h"
#import "XRDonateRelationViewController.h"

@interface XREditBookInfoViewController ()

@property (weak, nonatomic) IBOutlet UIButton *bookCover;
@property (weak, nonatomic) IBOutlet UITextField *bookName;
@property (weak, nonatomic) IBOutlet UITextField *bookPrice;
@property (weak, nonatomic) IBOutlet UITextField *bookAuthor;
@property (weak, nonatomic) IBOutlet UITextField *bookPublisher;
@property (weak, nonatomic) IBOutlet UITextField *bookISBN;
@property (weak, nonatomic) IBOutlet UITextView *introduction;

@end

@implementation XREditBookInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setRightBarItemWithString:LOCALSTRING(@"关联二维码") target:self action:@selector(submitBookData)];
    [self setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTableView {
    if (self.bookData) {
        [self.bookCover setTitle:@"" forState:UIControlStateNormal];
        [self.bookCover sd_setImageWithURL:[NSURL URLWithString:self.bookData.imgURL] forState:UIControlStateNormal];
        self.bookName.text = self.bookData.title;
        self.bookPrice.text = self.bookData.price;
        self.bookAuthor.text = self.bookData.author;
        self.bookPublisher.text = self.bookData.publisher;
        self.bookISBN.text = self.bookData.isbn;
        self.introduction.text = self.bookData.summary;
    }
}

- (void)submitBookData {
    __block BOOL dataChanged = NO;
    NSArray *originalDatas = @[@"title",@"price",@"author",@"publisher",@"isbn",@"summary"];
    NSArray *newDatas = @[self.bookName.text,self.bookPrice.text,self.bookAuthor.text,self.bookPublisher.text,self.bookISBN.text,self.introduction.text];
    [originalDatas enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *originalData = [self.bookData valueForKey:obj];
        NSString *newData = newDatas[idx];
        if (originalData && ![originalData isEqualToString:[newData trim]]) {
            [self.bookData setValue:newData forKey:obj];
        }
        dataChanged = YES;
    }];
    if (!dataChanged) {
        return;
    }

    //上传书籍信息
    XRDonateRelationViewController *donateRelationController = [XRDonateRelationViewController new];
    donateRelationController.bookData = self.bookData;
    [self.navigationController pushViewController:donateRelationController animated:YES];
}

- (void)uploadBook {

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
