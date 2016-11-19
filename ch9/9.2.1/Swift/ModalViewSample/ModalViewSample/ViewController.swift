//
//  ViewController.swift
//  ModalViewSample
//
//  Created by tonyguan on 2016/10/30.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(registerCompletion(_:)), name: NSNotification.Name(rawValue: "RegisterCompletionNotification"), object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        NotificationCenter.default.removeObserver(self)
    }
    
    func registerCompletion(_ notification: Notification) {
        
        let theData = notification.userInfo!
        let username = theData["username"] as! String
        
        print("username = ", username)
    }

}

