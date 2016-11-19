//
//  ViewController.swift
//  DatePickerSample
//
//  Created by tonyguan on 2016/10/21.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onclick(_ sender: AnyObject) {
        
        let theDate : Date = self.datePicker.date
        let desc = theDate.description(with: Locale.current)
        print("the date picked is:", desc)
        
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        print("the date formate is:", dateFormatter.string(from: theDate))
        
        self.label.text = dateFormatter.string(from: theDate)
        
    }


}

