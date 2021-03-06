//
//  ScheduleViewController.swift
//  TokyoOlympics
//
//  Created by tonyguan on 2016/11/17.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit
import BusinessLogicLayer
import PersistenceLayer

class ScheduleViewController: UITableViewController {
    
    //表视图使用的数据
    var data: [String : [Schedule]]!
    //比赛日期列表
    var arrayGameDateList: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  self.data == nil || self.data.count == 0 {
            let bl = ScheduleBL()
            self.data = bl.readData()
            let keys  = self.data.keys
            //对key进行排序
            self.arrayGameDateList = keys.sorted(by: <)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: --表视图数据源
    override func numberOfSections(in tableView: UITableView) -> Int {
        let keys = self.data.keys
        return keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //比赛日期
        let strGameDate = self.arrayGameDateList[section]
        //比赛日期下的比赛日程表
        let schedules = self.data[strGameDate]!
        return schedules.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //比赛日期
        let strGameDate = self.arrayGameDateList[section]
        return strGameDate
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        //比赛日期
        let strGameDate = self.arrayGameDateList[indexPath.section]
        //比赛日期下的比赛日程表
        let schedules = self.data[strGameDate]!
        let schedule = schedules[indexPath.row]
        
        let subtitle = String(format: "%@ | %@", schedule.GameInfo!, schedule.Event!.EventName!)
        cell.textLabel?.text = schedule.GameTime
        cell.detailTextLabel?.text = subtitle
        
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var listTitles = [String]()
        // 2016-08-09 -> 08-09
        for item in self.arrayGameDateList {
            let title = (item as NSString).substring(from: 5)
            listTitles.append(title)
        }
        return listTitles
    }

}
