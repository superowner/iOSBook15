//
//  ViewController.m
//  LabelButton
//
//  Created by tonyguan on 2016/10/20.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = 90;
    CGFloat labelHeight = 20;
    CGFloat labelTopView = 150;
    CGRect labelFrame = CGRectMake((screen.size.width - labelWidth)/2 , labelTopView, labelWidth, labelHeight);
    
    self.label = [[UILabel alloc] initWithFrame:labelFrame];
    
    self.label.text = @"Label";
    //字体左右居中
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"OK" forState:UIControlStateNormal];
    
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = 20;
    CGFloat buttonTopView = 240;
    
    button.frame = CGRectMake((screen.size.width - buttonWidth)/2 , buttonTopView, buttonWidth, buttonHeight);
    
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onClick:(id)sender {
    self.label.text = @"HelloWorld";
}

@end
