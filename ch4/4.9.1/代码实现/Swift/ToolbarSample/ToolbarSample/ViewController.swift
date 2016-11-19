//
//  ViewController.swift
//  ToolbarSample
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
        
        let toolbarHeight:CGFloat = 44 //44默认高度
        
        ///1.添加Toolbar
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: screen.size.height - toolbarHeight, width: screen.size.width, height: toolbarHeight))
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ViewController.save(_:)))
        
        let openButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(ViewController.open(_:)))
        
        
        let flexibleButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [saveButtonItem, flexibleButtonItem, openButtonItem]
        self.view.addSubview(toolbar)
        
        ///2.添加标签
        let labelWidth:CGFloat = 84
        let labelHeight:CGFloat = 21
        let labelTopView:CGFloat = 250
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
    
    func open(_ sender: AnyObject) {
        self.label.text = "点击Open"
    }
    
}

