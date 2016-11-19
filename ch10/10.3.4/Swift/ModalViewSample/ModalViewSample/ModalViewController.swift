//
//  ModalViewController.swift
//  ModalViewSample
//
//  Created by tonyguan on 2016/11/2.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save(_:)))
        let cancelButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        
        self.navigationItem.rightBarButtonItem = saveButtonItem
        self.navigationItem.leftBarButtonItem = cancelButtonItem
        
        /// UITextView
        let textView = UITextView(frame: self.view.frame)
        textView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        self.view.addSubview(textView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func save(_ sender: AnyObject) {
        self.dismiss(animated: true) { () -> Void in
            print("点击Save按钮，关闭模态视图")
        }
    }
    
    func cancel(_ sender: AnyObject) {
        self.dismiss(animated: true) { () -> Void in
            print("点击Cancel按钮，关闭模态视图")
        }
    }
}
