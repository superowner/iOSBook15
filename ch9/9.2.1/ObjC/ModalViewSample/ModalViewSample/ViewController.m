//
//  ViewController.m
//  ModalViewSample
//
//  Created by tonyguan on 2016/10/30.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerCompletion:) name:@"RegisterCompletionNotification" object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)registerCompletion:(NSNotification*)notification {
    
    NSDictionary *theData = [notification userInfo];
    NSString *username = theData[@"username"];
    
    NSLog(@"username = %@",username);
}

@end
