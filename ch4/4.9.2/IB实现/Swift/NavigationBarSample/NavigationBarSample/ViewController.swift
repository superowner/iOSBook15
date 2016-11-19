//
//  ViewController.swift
//  NavigationBarSample
//
//  Created by tonyguan on 2016/10/21.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: AnyObject) {
        self.label.text = "点击Save"
    }
    
    @IBAction func add(_ sender: AnyObject) {
        self.label.text = "点击Add"
    }
}

