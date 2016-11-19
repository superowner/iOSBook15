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

