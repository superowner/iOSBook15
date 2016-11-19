//
//  BlueViewController.swift
//  SplitViewSample
//
//  Created by tonyguan on 2016/11/2.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detailFrame = self.navigationController!.view.frame
        
        self.view.backgroundColor = UIColor.blue
        
        let buttonWidth:CGFloat = 60
        let buttonHeight:CGFloat = 20
        let buttonX: CGFloat = (detailFrame.size.width - buttonWidth)/2
        let buttonY: CGFloat = (detailFrame.size.height - buttonHeight)/2
        
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("Tap", for: UIControlState())
        
        button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 28)
        button.setTitleColor(UIColor.white, for: UIControlState())
        
        button.addTarget(self, action: #selector(BlueViewController.onClick(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick(_ sender: AnyObject) {
        
        let alertController: UIAlertController = UIAlertController(title: "系统消息", message: "蓝色视图", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
    }
    
}

