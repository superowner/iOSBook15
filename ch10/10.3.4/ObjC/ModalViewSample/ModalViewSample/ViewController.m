//
//  ViewController.m
//  ModalViewSample
//
//  Created by tonyguan on 2016/11/2.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///创建Full Screen按钮
    UIButton* buttonFullScreen = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonFullScreen setTitle:@"Full Screen" forState:UIControlStateNormal];
    buttonFullScreen.titleLabel.font = [UIFont systemFontOfSize:20];
    [buttonFullScreen addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    //设置tag区别其他的按钮
    buttonFullScreen.tag = 100;
    [self.view addSubview:buttonFullScreen];
    
    ///创建Form Sheet按钮
    UIButton* buttonFormSheet = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonFormSheet setTitle:@"Form Sheet" forState:UIControlStateNormal];
    buttonFormSheet.titleLabel.font = [UIFont systemFontOfSize:20];
    [buttonFormSheet addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    //设置tag区别其他的按钮
    buttonFormSheet.tag = 200;
    [self.view addSubview:buttonFormSheet];
    
    ///创建Page Sheet按钮
    UIButton* buttonPageSheet = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonPageSheet setTitle:@"Page Sheet" forState:UIControlStateNormal];
    buttonPageSheet.titleLabel.font = [UIFont systemFontOfSize:20];
    [buttonPageSheet addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    //设置tag区别其他的按钮
    buttonPageSheet.tag = 300;
    [self.view addSubview:buttonPageSheet];
    
    ///创建Current Context按钮
    UIButton* buttonCurrentContext = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonCurrentContext setTitle:@"Current Context" forState:UIControlStateNormal];
    buttonCurrentContext.titleLabel.font = [UIFont systemFontOfSize:20];
    [buttonCurrentContext addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    //设置tag区别其他的按钮
    buttonCurrentContext.tag = 400;
    [self.view addSubview:buttonCurrentContext];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    NSLog(@"重新布局");
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat buttonWidth = 200;
    CGFloat buttonHeight = 20;
    CGFloat buttonTopView = 115;
    CGFloat buttonX = (screen.size.width - buttonWidth)/2;
    
    ///创建Full Screen按钮
    UIButton* buttonFullScreen = [self.view viewWithTag:100];
    buttonFullScreen.frame = CGRectMake(buttonX, buttonTopView, buttonWidth, buttonHeight);
    
    ///创建Form Sheet按按钮
    UIButton* buttonFormSheet = [self.view viewWithTag:200];
    buttonFormSheet.frame = CGRectMake(buttonX, buttonFullScreen.frame.origin.y + 100, buttonWidth, buttonHeight);
    
    ///创建Page Sheet按钮
    UIButton* buttonPageSheet = [self.view viewWithTag:300];
    buttonPageSheet.frame = CGRectMake(buttonX, buttonFormSheet.frame.origin.y + 100, buttonWidth, buttonHeight);
    
    ///创建Current Context按钮
    UIButton* buttonCurrentContext = [self.view viewWithTag:400];
    buttonCurrentContext.frame = CGRectMake(buttonX, buttonPageSheet.frame.origin.y + 100, buttonWidth, buttonHeight);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onclick:(id)sender {
    
    ModalViewController *modalViewController = [[ModalViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:modalViewController];
    navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    UIButton *button = (UIButton*)sender;
    
    switch (button.tag) {
        case 100:
            navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
            break;
        case 200:
            navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
            break;
        case 300:
            navigationController.modalPresentationStyle = UIModalPresentationPageSheet;
            break;
        case 400:
            navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
            break;
        default:
            NSLog(@"默认分支");
    }
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

@end
