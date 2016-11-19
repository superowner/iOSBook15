//
//  ViewController.m
//  LabelButton
//
//  Created by tonyguan on 2016/10/20.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)onClick:(id)sender;
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


- (IBAction)onClick:(id)sender {
    self.label.text = @"HelloWorld";
}

@end
