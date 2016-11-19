//
//  ViewController.m
//  ToolbarSample
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
    
    CGFloat toolbarHeight = 44; //44默认高度
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, screen.size.height - toolbarHeight, screen.size.width, toolbarHeight)];
    
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                                       UIBarButtonSystemItemSave
                                                                                    target:self action:@selector(save:)];
    
    UIBarButtonItem *openButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Open"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self action:@selector(open:)];
    
    
    UIBarButtonItem *flexibleButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                                           UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    toolbar.items = @[saveButtonItem, flexibleButtonItem, openButtonItem];
    [self.view addSubview:toolbar];
    
    CGFloat labelWidth = 84;
    CGFloat labelHeight = 21;
    CGFloat labelTopView = 250;
    
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

- (void)open:(id)sender {
    self.label.text = @"点击Open";
}

@end
