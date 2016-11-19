//
//  ViewController.swift
//  UploadDownload
//
//  Created by tonyguan on 2016/10/21.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startToMove(_ sender: AnyObject) {
        if (self.activityIndicatorView.isAnimating) {
            self.activityIndicatorView.stopAnimating()
        }else{
            self.activityIndicatorView.startAnimating()
        }
    }
    
    @IBAction func downloadProgress(_ sender: AnyObject) {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.download), userInfo: nil, repeats: true)
    }
    
    func download() {
        self.progressView.progress = self.progressView.progress + 0.1
        if (self.progressView.progress == 1.0) {
            self.timer.invalidate()
            
            let alertController: UIAlertController = UIAlertController(title: "download completed！", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            //显示
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}

