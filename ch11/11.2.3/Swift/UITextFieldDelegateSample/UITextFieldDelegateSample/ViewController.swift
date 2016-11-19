//
//  ViewController.swift
//  UITextFieldDelegateSample
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


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: --实现UITextFieldDelegate 委托协议方法
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("call textFieldShouldBeginEditing:")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("call textFieldDidBeginEditing:")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("call textFieldShouldEndEditing:")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("call textFieldDidEndEditing:")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("call textFieldShouldReturn:")
        textField.resignFirstResponder()
        return true
    }
}
