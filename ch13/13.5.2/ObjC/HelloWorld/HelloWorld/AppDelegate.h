//
//  AppDelegate.h
//  HelloWorld
//
//  Created by tonyguan on 2016/11/3.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

