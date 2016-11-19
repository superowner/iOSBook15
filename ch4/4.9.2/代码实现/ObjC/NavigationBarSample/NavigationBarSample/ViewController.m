//
//  ViewController.m
//  NavigationBarSample
//
//  Created by tonyguan on 2016/10/21.
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
    
    CGFloat navigationBarHeight = 44; //44默认高度
    
    /// 1.创建NavigationBar
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, screen.size.width, navigationBarHeight)];
    
    
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                                       UIBarButtonSystemItemSave target:self action:@selector(save:)];
    
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                                      UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@""];
    navigationItem.leftBarButtonItem = saveButtonItem;
    navigationItem.rightBarButtonItem = addButtonItem;
    
    navigationBar.items = @[navigationItem];
    
    [self.view addSubview:navigationBar];
    
    /// 2.添加标签
    CGFloat labelWidth = 84;
    CGFloat labelHeight = 21;
    CGFloat labelTopView = 198;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - labelWidth)/2 , labelTopView, labelWidth, labelHeight)];
    
    self.label.text = @"Label";
    //字体左右居中
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)save:(id)sender {
    self.label.text = @"点击Save";
}

- (void)add:(id)sender {
    self.label.text = @"点击Add";
}

@end
