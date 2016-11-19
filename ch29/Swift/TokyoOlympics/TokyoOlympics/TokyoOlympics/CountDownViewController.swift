//
//  CountDownViewController.swift
//  TokyoOlympics
//
//  Created by tonyguan on 2016/11/17.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {
    
    //显示倒计时
    @IBOutlet weak var lblCountDownPhone: UILabel!
    @IBOutlet weak var lblCountDownPad: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建NSDateComponents对象
        var comps = DateComponents()
        //设置NSDateComponents日期
        comps.day = 24
        //设置NSDateComponents月
        comps.month = 7
        //设置NSDateComponents年
        comps.year = 2020
        
        //创建日历对象
        let calender = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
        
        //获得2020-7-24日的NSDate日期对象
        let destinationDate = calender!.date(from: comps)
        
        let date = Date()
        //获得当前日期到2020-7-24时间的NSDateComponents对象
        let components = calender!.components(.day, from: date , to:destinationDate!, options:.wrapComponents)
        //获得当前日期到2020-7-24相差的天数
        let days = components.day
        
        let strDays = String(format:"%li", days!)
        //设置iPhone中的标签
        self.lblCountDownPhone.text = strDays
        //设置Pad中的标签
        self.lblCountDownPad.text = strDays
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
