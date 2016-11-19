//
//  YellowViewController.m
//  SplitViewSample
//
//  Created by tonyguan on 2016/11/1.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "YellowViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender {
    
    UIAlertController* alertController = [UIAlertController
                                          alertControllerWithTitle:@"系统消息"
                                          message: @"蓝色视图"
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    //显示
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
