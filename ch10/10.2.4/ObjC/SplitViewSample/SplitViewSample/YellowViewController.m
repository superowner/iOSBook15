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
    
    CGRect detailFrame = self.navigationController.view.frame;
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = 20;
    CGFloat buttonX = (detailFrame.size.width - buttonWidth)/2;
    CGFloat buttonY = (detailFrame.size.height - buttonHeight)/2;
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Tap" forState:UIControlStateNormal];
    
    button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
    button.titleLabel.font = [UIFont systemFontOfSize:28];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender {
    
    UIAlertController* alertController = [UIAlertController
                                          alertControllerWithTitle:@"系统消息"
                                          message: @"黄色视图"
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    //显示
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
