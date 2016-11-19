//
//  ViewController.m
//  PopoverViewSample
//
//  Created by tonyguan on 2016/11/2.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"
#import "SelectViewController.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate>

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

- (IBAction)show:(id)sender {
    
    SelectViewController *popoverViewController = [[SelectViewController alloc] init];
    popoverViewController.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:popoverViewController animated:YES completion:nil];
    
    // 配置PopoverPresentationController
    UIPopoverPresentationController *popController = [popoverViewController popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = sender;
    popController.delegate = self;
    
}

# pragma mark --实现UIPopoverPresentationControllerDelegate协议
- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController {
    NSLog(@"呈现Popover视图");
}

- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    NSLog(@"关闭Popover视图");
}

@end
