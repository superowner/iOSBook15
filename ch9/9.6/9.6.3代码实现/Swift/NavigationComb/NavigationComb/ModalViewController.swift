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
        
        self.view.backgroundColor = UIColor.white
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save(_:)))
        self.navigationItem.rightBarButtonItem = saveButtonItem
        
        let cancelButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        self.navigationItem.leftBarButtonItem = cancelButtonItem
        
        let screen = UIScreen.main.bounds
        
        let textViewWidth:CGFloat = 320
        let textViewHeight: CGFloat = 200
        let textViewTopView: CGFloat = 100
        let textView = UITextView(frame: CGRect(x: (screen.size.width - textViewWidth)/2 , y: textViewTopView, width: textViewWidth, height: textViewHeight))
        
        textView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        self.view.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func save(_ sender: AnyObject) {
        
    }
    
    func cancel(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: { () -> Void in
            print("关闭模态视图")
        })
    }
}
