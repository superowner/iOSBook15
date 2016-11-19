//
//  ViewController.m
//  NavigationBarSample
//
//  Created by tonyguan on 2016/10/21.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)save:(id)sender {
    self.label.text = @"点击Save";
}

- (IBAction)add:(id)sender {
    self.label.text = @"点击Add";
}

@end
