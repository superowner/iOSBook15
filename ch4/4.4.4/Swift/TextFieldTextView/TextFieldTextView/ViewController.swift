//
//  ViewController.swift
//  TextFieldTextView
//
//  Created by tonyguan on 2016/10/20.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
        //注册键盘出现通知
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        //注册键盘隐藏通知
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //注销键盘出现通知
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        //注销键盘隐藏通知
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    func keyboardDidShow(_ notification: NSNotification) {
        print("键盘打开")
    }
    
    func keyboardDidHide(_ notification: NSNotification) {
        print("键盘关闭")
    }
    
    // MARK: - 实现UITextFieldDelegate委托协议方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - 实现UITextViewDelegate委托协议方法
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

}

