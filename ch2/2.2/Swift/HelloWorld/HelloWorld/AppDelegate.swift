//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by tonyguan on 2016/10/19.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("application:didFinishLaunchingWithOptions:")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("applicationWillResignActive:")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground:")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground:")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive:")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate:")
    }

}

