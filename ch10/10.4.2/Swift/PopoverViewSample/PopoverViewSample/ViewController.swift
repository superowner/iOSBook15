//
//  ViewController.swift
//  PopoverViewSample
//
//  Created by tonyguan on 2016/11/2.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func show(_ sender: AnyObject) {
        
        let popoverViewController = SelectViewController()
        popoverViewController.modalPresentationStyle = .popover
        self.present(popoverViewController, animated: true, completion: nil)
        
        // 配置PopoverPresentationController
        let popController = popoverViewController.popoverPresentationController
        popController!.permittedArrowDirections = .any
        popController!.barButtonItem = sender as? UIBarButtonItem
        popController!.delegate = self
        
    }
    
    //MARK: --实现UIPopoverPresentationControllerDelegate协议
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        print("呈现Popover视图")
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("关闭Popover视图")
    }

}

