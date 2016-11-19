//
//  ModalViewController.m
//  ModalViewSample
//
//  Created by tonyguan on 2016/11/2.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)save:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"点击Save按钮，关闭模态视图");
    }];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"点击Cancel按钮，关闭模态视图");
    }];
}


@end
