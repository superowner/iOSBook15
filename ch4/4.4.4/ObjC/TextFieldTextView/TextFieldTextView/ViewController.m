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

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //注册键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:) name: UIKeyboardDidShowNotification object:nil];
    //注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:) name: UIKeyboardDidHideNotification object:nil];
    
}


-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //注销键盘出现通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name: UIKeyboardDidShowNotification object:nil];
    //注销键盘隐藏通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name: UIKeyboardDidHideNotification object:nil];
    
}

-(void) keyboardDidShow: (NSNotification *)notification {
    NSLog(@"键盘打开");
}

-(void) keyboardDidHide: (NSNotification *)notification {
    NSLog(@"键盘关闭");
}

#pragma mark - 实现UITextFieldDelegate委托协议方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - 实现UITextViewDelegate委托协议方法
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


@end
