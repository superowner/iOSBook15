//
//  RegisterViewController.swift
//  ModalViewSample
//
//  Created by tonyguan on 2016/10/30.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    var txtUsername: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "注册"
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save(_:)))
        
        let cancelButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        
        self.navigationItem.rightBarButtonItem = saveButtonItem
        self.navigationItem.leftBarButtonItem = cancelButtonItem
        
        /// 1.添加用户ID：标签
        let labelId = UILabel(frame: CGRect(x: 35, y: 187, width: 100, height: 21))
        labelId.text = "用户ID："
        self.view.addSubview(labelId)
        
        /// 2.添加Username TextField
        self.txtUsername = UITextField(frame: CGRect(x: 180, y: 178, width: 131, height: 30))
        self.txtUsername.borderStyle = .roundedRect
        self.view.addSubview(self.txtUsername)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func save(_ sender: AnyObject) {
        
        self.dismiss(animated: true) { () -> Void in
            NSLog("点击Save按钮，关闭模态视图")
            
            let dataDict = ["username" : self.txtUsername.text!]
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: "RegisterCompletionNotification"), object: nil, userInfo: dataDict)
            
        }
    }
    
    func cancel(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: {
            NSLog("点击Cancel按钮，关闭模态视图")
        })
    }

}
