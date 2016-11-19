//
//  AppDelegate.m
//  HelloWorld
//
//  Created by tonyguan on 2016/10/19.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@", @"application:didFinishLaunchingWithOptions:");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%@", @"applicationWillResignActive:");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%@", @"applicationDidEnterBackground:");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%@", @"applicationWillEnterForeground:");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%@", @"applicationDidBecomeActive:");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%@", @"applicationWillTerminate:");
}

@end
