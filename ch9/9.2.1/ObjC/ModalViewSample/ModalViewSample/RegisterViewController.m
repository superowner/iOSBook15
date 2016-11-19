//
//  RegisterViewController.m
//  ModalViewSample
//
//  Created by tonyguan on 2016/10/30.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtUsername;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)save:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"点击Save按钮，关闭模态视图");
        
        NSDictionary *dataDict = @{@"username" : self.txtUsername.text};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dataDict];
        
    }];
    
}

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"点击Cancel按钮，关闭模态视图");
    }];
    
}

@end
