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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    

    @IBAction func save(_ sender: AnyObject) {
        self.dismiss(animated: true) { () -> Void in
             print("点击Save按钮，关闭模态视图")
        }
    }

    @IBAction func cancel(_ sender: AnyObject) {
        self.dismiss(animated: true) { () -> Void in
            print("点击Cancel按钮，关闭模态视图")
        }
    }
}
