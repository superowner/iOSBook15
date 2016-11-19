//
//  AppDelegate.swift
//  KVOSample
//
//  Created by 关东升 on 2016-11-18.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    dynamic var appStatus: NSString!
    var observer: AppStatusObserver!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.observer = AppStatusObserver()
        self.addObserver(self.observer, forKeyPath: "appStatus",
            options: [NSKeyValueObservingOptions.new ,NSKeyValueObservingOptions.old], context: nil)
        self.appStatus = "launch"
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        self.appStatus = "inactive"
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        self.appStatus = "background"
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        self.appStatus = "inactive"
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        self.appStatus = "active"
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.appStatus = "terminate"
    }
}


