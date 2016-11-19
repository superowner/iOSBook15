//
//  ViewController.m
//  ScreenTest
//
//  Created by tonyguan on 2016/10/26.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize iOSDeviceScreenSize  = [UIScreen mainScreen].bounds.size;
    
    NSString *s = [NSString stringWithFormat:@"%.0f x %.0f", iOSDeviceScreenSize.width, iOSDeviceScreenSize.height];
    NSLog(@"%@", s);
    
    self.label.text = s;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        
        if (iOSDeviceScreenSize.height > iOSDeviceScreenSize.width) {//竖屏情况
            if (iOSDeviceScreenSize.height == 568) {//iPhone 5/5s/5c/SE设备
                NSLog(@"iPhone 5/5s/5c/SE设备");
            } else if (iOSDeviceScreenSize.height == 667) {//iPhone 6/6s/7
                NSLog(@"iPhone 6/6s/7设备");
            } else if (iOSDeviceScreenSize.height == 736) {//iPhone Plus
                NSLog(@"iPhone Plus设备");
            } else {//其他设备
                NSLog(@"其他设备");
            }
        }
        if (iOSDeviceScreenSize.width > iOSDeviceScreenSize.height) {//横屏情况
            if (iOSDeviceScreenSize.width == 568) {//iPhone 5/5s/5c/SE设备
                NSLog(@"iPhone 5/5s/5c/SE设备");
            } else if (iOSDeviceScreenSize.width == 667) {//iPhone 6/6s/7
                NSLog(@"iPhone 6/6s/7设备");
            } else if (iOSDeviceScreenSize.width == 736) {//iPhone Plus
                NSLog(@"iPhone Plus设备");
            } else {//其他设备
                NSLog(@"其他设备");
            }
        }
    }
}

@end
