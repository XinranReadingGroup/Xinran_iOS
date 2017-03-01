//
//  XRProfileViewController.m
//  XinranReadingGroup
//
//  Created by peichuang on 16/10/6.
//  Copyright © 2016年 SnowWolf. All rights reserved.
//

#import "XRProfileViewController.h"
#import "ZYCoreCellInfo.h"
#import "XRProfileDetailCell.h"
#import "XRProfileEditViewController.h"
#import "XRUser.h"
#import "XRUserService.h"
#import "XRLoginBiz.h"
#import "SVProgressHUD.h"
#import <ZYCoreFramework/ZYCoreDefine.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <SDWebImageManager.h>

@interface XRProfileViewController ()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation XRProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = LOCALSTRING(@"个人信息");
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.backgroundColor = [UIColor colorWithRed:239/255. green:239/255. blue:239/255. alpha:1];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupData
{
    NSArray *firstTypes = @[@(ProfileDetailTypeAvatar),@(ProfileDetailTypeNickName),@(ProfileDetailTypePassword)];
    NSArray *secondTypes = @[@(ProfileDetailTypeIntroduction)];

    NSMutableArray *section1 = [NSMutableArray array];
    [firstTypes enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *cellData = @{@"type":obj};
        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRProfileDetailCell class] withCellHeight:[XRProfileDetailCell cellHeightForType:[obj integerValue]] withCellData:cellData withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, ZYCoreCellInfo *cellData) {
            ProfileDetailType type = [[cellData.cellData objectForKey:@"type"] integerValue];
            if (type == ProfileDetailTypeNickName) {
                XRProfileEditViewController *profileEditController = [[XRProfileEditViewController alloc] initWithNibName:@"XRProfileEditViewController" bundle:nil];
                profileEditController.cellData = cellData.cellData;
                [self.navigationController pushViewController:profileEditController animated:YES];
            } else if (type == ProfileDetailTypeAvatar) {
                UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册", nil];
                [actionSheet showInView:self.view];
            } else if (type == ProfileDetailTypePassword) {
                [SVProgressHUD showWithStatus:@"请到web页面上修改密码"];
            }
        }];
        cellInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [section1 addObject:cellInfo];
    }];
    
    NSMutableArray *section2 = [NSMutableArray array];
    [secondTypes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *cellData = @{@"type":obj};
        ZYCoreCellInfo *cellInfo = [[ZYCoreCellInfo alloc] initWithCellClass:[XRProfileDetailCell class] withCellHeight:[XRProfileDetailCell cellHeightForType:[obj integerValue]] withCellData:cellData withDidSelectedCallBack:^(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, ZYCoreCellInfo *cellData) {
            ProfileDetailType type = [[cellData.cellData objectForKey:@"type"] integerValue];
            if (type == ProfileDetailTypeIntroduction) {
                XRProfileEditViewController *profileEditController = [[XRProfileEditViewController alloc] initWithNibName:@"XRProfileEditViewController" bundle:nil];
                profileEditController.cellData = cellData.cellData;
                [self.navigationController pushViewController:profileEditController animated:YES];
            }
        }];
        cellInfo.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [section2 addObject:cellInfo];
    }];
    
    self.tableViewData = @[section1, section2];
    
    [XRLoginBiz refreshUserProfile:^{
        [self.tableView reloadData];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 22;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 22)];
    view.backgroundColor = [UIColor colorWithRed:239/255. green:239/255. blue:239/255. alpha:1];
    return view;
}

#pragma mark - action sheet

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0 || buttonIndex == 1) {
        if (buttonIndex == 0) {
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (authStatus ==AVAuthorizationStatusRestricted ||//此应用程序没有被授权访问的照片数据。可能是家长控制权限
                authStatus ==AVAuthorizationStatusDenied)  //用户已经明确否认了这一照片数据的应用程序访问
            {
                // 无权限 引导去开启
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication]canOpenURL:url]) {
                    [[UIApplication sharedApplication]openURL:url];
                }
            } else {
                UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
                pickerController.delegate = self;
                pickerController.allowsEditing = YES;
                pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:pickerController animated:YES completion:nil];
            }
            
        } else if (buttonIndex == 1) {
            ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
            if (author ==ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied){
                //无权限 引导去开启
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            } else {
                UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
                pickerController.delegate = self;
                pickerController.allowsEditing = YES;
                pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:pickerController animated:YES completion:nil];
            }
        }
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (image) {
        NSData *data = UIImageJPEGRepresentation(image, 0.5);
        [XRUserService uploadPhotoWith:data success:^(id param) {
            [SVProgressHUD showSuccessWithStatus:@"头像上传成功"];
            NSString *cacheKey = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:[XRUser sharedXRUser].profile.avatarUrl]];
            [[SDWebImageManager sharedManager].imageCache removeImageForKey:cacheKey];
            [self setupData];
        } failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:@"头像上传失败"];
        }];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
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
