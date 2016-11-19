//
//  ViewController.swift
//  LabelButton
//
//  Created by tonyguan on 2016/10/20.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        let labelWidth:CGFloat = 90
        let labelHeight:CGFloat = 20
        let labelTopView:CGFloat = 150
        let labelFrame = CGRect(x: (screen.size.width - labelWidth)/2 ,
                           y: labelTopView, width: labelWidth, height: labelHeight)
        
        self.label = UILabel(frame: labelFrame)
        
        self.label.text = "Label"
        //字体左右居中
        self.label.textAlignment = NSTextAlignment.center
        self.view.addSubview(self.label)
        
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("OK", for: UIControlState.normal)
        
        let buttonWidth:CGFloat = 60
        let buttonHeight:CGFloat = 20
        let buttonTopView:CGFloat = 240
        
        button.frame = CGRect(x: (screen.size.width - buttonWidth)/2 ,
                              y: buttonTopView, width: buttonWidth, height: buttonHeight)
        button.addTarget(self, action: #selector(onClick(_:)),
                         for: UIControlEvents.touchUpInside)
        
//        button.addTarget(self, action: #selector(onClick(_:forEvent:)),
//                         for: UIControlEvents.touchUpInside)

        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onClick(_ sender: AnyObject) {
        self.label.text = "HelloWorld"
    }

//    func onClick(_ sender: AnyObject, forEvent event: UIEvent) {
//        print("OK Button onClick.")
//    }

}

