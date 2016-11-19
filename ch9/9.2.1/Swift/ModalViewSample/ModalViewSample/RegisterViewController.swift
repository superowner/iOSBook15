//
//  RegisterViewController.swift
//  ModalViewSample
//
//  Created by tonyguan on 2016/10/30.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func save(_ sender: AnyObject) {
        
        self.dismiss(animated: true) { () -> Void in
            print("点击Save按钮，关闭模态视图")
            
            let dataDict = ["username" : self.txtUsername.text!]
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: "RegisterCompletionNotification"), object: nil, userInfo: dataDict)
            
        }
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: {
            print("点击Cancel按钮，关闭模态视图")
        })
    }
}
