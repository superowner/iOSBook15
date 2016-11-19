//
//  DetailViewController.m
//  SplitViewSample
//
//  Created by tonyguan on 2016/11/1.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"选择的行号： %li", (long)self.selectRow);
    
    if (self.selectRow == 0) {
        //蓝色
        UIViewController* blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"blueViewController"];
        [self addChildViewController:blueViewController];
        [self.view addSubview:blueViewController.view];
    } else {
        //黄色
        UIViewController* yellowViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"yellowViewController"];
        [self addChildViewController:yellowViewController];
        [self.view addSubview:yellowViewController.view];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
