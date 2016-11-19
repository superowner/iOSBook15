//
//  ViewController.swift
//  SwitchSliderSegmentedControl
//
//  Created by tonyguan on 2016/10/20.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftSwitch: UISwitch!
    
    @IBOutlet weak var rightSwitch: UISwitch!
    
    @IBOutlet weak var sliderValue: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //使两个开关的值保持一致
    @IBAction func switchValueChanged(_ sender: AnyObject) {
        let witchSwitch = sender as! UISwitch
        let setting = witchSwitch.isOn
        self.leftSwitch.setOn(setting, animated: true)
        self.rightSwitch.setOn(setting, animated: true)
    }
    
    //点击分段控件控制开关控件的隐藏或显示
    @IBAction func touchDown(_ sender: AnyObject) {
        
        let segmentedControl = sender as! UISegmentedControl
        NSLog("选择的段 : ", segmentedControl.selectedSegmentIndex)
        
        if (self.leftSwitch.isHidden == true) {
            self.rightSwitch.isHidden = false
            self.leftSwitch.isHidden  = false
        }else {
            self.rightSwitch.isHidden = true
            self.leftSwitch.isHidden  = true
        }
    }
    
    //用标签显示滑块的值
    @IBAction func sliderValueChange(_ sender: AnyObject) {
        let slider = sender as! UISlider
        let progressAsInt = Int(slider.value)
        let newText = String(format: "%d", progressAsInt)
        NSLog("滑块的值 : ", newText)
        self.sliderValue.text = newText
    }

}

