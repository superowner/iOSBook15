//
//  TodayViewController.swift
//  CountDown
//
//  Created by tonyguan on 2016/11/13.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var lblCountDown: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建NSDateComponents对象
        let comps = NSDateComponents()
        //设置NSDateComponents日期
        comps.day = 24
        //设置NSDateComponents月
        comps.month = 7
        //设置NSDateComponents年
        comps.year = 2020
        
        //创建日历对象
        let calender = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
        
        //获得2020-7-24日的NSDate日期对象
        let destinationDate = calender!.date(from: comps as DateComponents)
        let date = Date()
        //获得当前日期到2020-7-24时间的NSDateComponents对象
        let components = calender!.components(.day, from: date, to:destinationDate!, options: .wrapComponents)
        //获得当前日期到2020-7-24相差的天数
        let days = components.day
        
        let strLabel = NSMutableAttributedString(string: String(format:"%i天", days!))
        
        strLabel.addAttribute(NSFontAttributeName,
                              value: UIFont.preferredFont(forTextStyle: .footnote),
                              range: NSMakeRange(strLabel.length - 1, 1))
        
        self.lblCountDown.attributedText = strLabel
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
