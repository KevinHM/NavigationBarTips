//
//  KHMMainPageViewController.m
//  NavigationBarTipsDemo
//
//  Created by ShenzhenSenink technology Co.,LTD on 15/8/7.
//  Copyright (c) 2015年 KevinHM. All rights reserved.
//

#import "KHMMainPageViewController.h"
#import "UIViewController+BackButtonItemTitle.h"

static NSString * const KHMDemoPageSegueID = @"demoPageSegueID";

@interface KHMMainPageViewController ()

@end

@implementation KHMMainPageViewController

#pragma mark - Life View Cycle

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
    [self performSegueWithIdentifier:KHMDemoPageSegueID sender:self];
}

#pragma mark - Segue

- (IBAction)unwindToMainPage:(UIStoryboardSegue *)sender {
    NSLog(@"来自:%@",sender.sourceViewController);
}

#pragma mark - 

- (NSString *)navigationItemBackBarButtonTitle {
    return @"自定义Title";
}


@end
