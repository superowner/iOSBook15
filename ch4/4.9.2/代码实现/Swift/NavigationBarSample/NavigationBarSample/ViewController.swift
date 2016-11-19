//
//  ViewController.swift
//  NavigationBarSample
//
//  Created by tonyguan on 2016/10/21.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        /// 1.创建NavigationBar
        let navigationBarHeight:CGFloat = 44 //44默认高度
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screen.size.width, height: navigationBarHeight))
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ViewController.save(_:)))
        
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.add(_:)))
        
        let navigationItem = UINavigationItem(title: "")
        navigationItem.leftBarButtonItem = saveButtonItem
        navigationItem.rightBarButtonItem = addButtonItem
        
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
        
        ///2.添加标签
        let labelWidth:CGFloat = 84
        let labelHeight:CGFloat = 21
        let labelTopView:CGFloat = 198
        self.label = UILabel(frame: CGRect(x: (screen.size.width - labelWidth)/2 , y: labelTopView, width: labelWidth, height: labelHeight))
        
        self.label.text = "Label"
        //字体左右居中
        self.label.textAlignment = .center
        self.view.addSubview(self.label)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func save(_ sender: AnyObject) {
        self.label.text = "点击Save"
    }
    
    func add(_ sender: AnyObject) {
        self.label.text = "点击Add"
    }

}

