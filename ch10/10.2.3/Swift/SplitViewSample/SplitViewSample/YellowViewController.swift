//
//  YellowViewController.swift
//  SplitViewSample
//
//  Created by tonyguan on 2016/11/2.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onClick(_ sender: AnyObject) {
        
        let alertController: UIAlertController = UIAlertController(title: "系统消息", message: "黄色视图", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
    }

}
