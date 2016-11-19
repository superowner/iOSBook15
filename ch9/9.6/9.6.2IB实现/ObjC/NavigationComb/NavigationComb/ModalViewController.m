//
//  ModalViewController.m
//  NavigationComb
//
//  Created by tonyguan on 2016/10/31.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:^{
        NSLog(@"关闭模态视图");
    }];
}

@end
