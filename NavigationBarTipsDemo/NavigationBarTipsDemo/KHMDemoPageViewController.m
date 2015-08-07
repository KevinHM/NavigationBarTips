//
//  KHMDemoPageViewController.m
//  NavigationBarTipsDemo
//
//  Created by ShenzhenSenink technology Co.,LTD on 15/8/7.
//  Copyright (c) 2015年 KevinHM. All rights reserved.
//

#import "KHMDemoPageViewController.h"
#import "UIViewController+BackButtonHandler.h"
#import "UIViewController+BackButtonItemTitle.h"

static NSString * const KHMDemoPageAgainSegueID = @"demoPageSegueAgainID";

@interface KHMDemoPageViewController () <UIAlertViewDelegate>

@end

@implementation KHMDemoPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = \
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self
                                                  action:@selector(pushDemoPage)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Response

- (void)pushDemoPage {
    [self performSegueWithIdentifier:KHMDemoPageAgainSegueID sender:self];
}

#pragma mark - Unwind Segue
- (IBAction)unwindToDemoPage:(UIStoryboardSegue *)sender {
    NSLog(@"到 %@ 去",sender.destinationViewController);
}

#pragma mark - BackButtonItemTitleProtocol

- (NSString *)navigationItemBackBarButtonTitle {
    return @"返回";
}

#pragma mark - BackButtonHandlerProtocol

- (BOOL)navigationShouldPopOnBackButton {
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"警告" message:@"你确定要退出?" preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(self) weakSelf = self;
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    [alertVC addAction:cancelAction];
    [alertVC addAction:confirmAction];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
#else
    
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"你确定要退出?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alertView show];
    
#endif
    
    return NO;
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (1 == buttonIndex) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#endif

@end
