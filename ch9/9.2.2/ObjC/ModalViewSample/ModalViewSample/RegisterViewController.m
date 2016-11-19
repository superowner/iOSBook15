//
//  RegisterViewController.m
//  ModalViewSample
//
//  Created by tonyguan on 2016/10/30.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (strong, nonatomic) UITextField *txtUsername;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                                       UIBarButtonSystemItemSave target:self action:@selector(save:)];
    
    UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                                         UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    self.navigationItem.rightBarButtonItem = saveButtonItem;
    self.navigationItem.leftBarButtonItem = cancelButtonItem;
    
    
    /// 1.添加用户ID：标签
    UILabel* labelId = [[UILabel alloc] initWithFrame:CGRectMake(35, 187, 100, 21)];
    labelId.text = @"用户ID：";
    [self.view addSubview:labelId];
    
    /// 2.添加Username TextField
    self.txtUsername = [[UITextField alloc] initWithFrame:CGRectMake(180, 178, 131, 30)];
    self.txtUsername.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.txtUsername];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)save:(id)sender {
    
    [self dismissViewControllerAnimated:TRUE completion:^{
        
        NSLog(@"点击Save按钮，关闭模态视图");
        
        NSDictionary *dataDict = @{@"username" : self.txtUsername.text};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dataDict];
        
    }];
    
}

- (void)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:TRUE completion:^{
        NSLog(@"点击Cancel按钮，关闭模态视图");
    }];
    
}

@end
