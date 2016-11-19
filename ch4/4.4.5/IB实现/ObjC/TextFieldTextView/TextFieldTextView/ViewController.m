//
//  ViewController.m
//  TextFieldTextView
//
//  Created by tonyguan on 2016/10/20.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()  <UITextFieldDelegate, UITextViewDelegate>

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

#pragma mark - 实现UITextFieldDelegate委托协议方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"TextField获得焦点，点击return键");
    return YES;
}


#pragma mark - 实现UITextViewDelegate委托协议方法
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        NSLog(@"TextView获得焦点，点击return键");
        return NO;
    }
    return YES;
}


@end
