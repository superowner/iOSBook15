//
//  ModalViewController.swift
//  NavigationComb
//
//  Created by tonyguan on 2016/10/31.
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
    
    @IBAction func cancel(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: { () -> Void in
            NSLog("关闭模态视图")
        })
    }
}
