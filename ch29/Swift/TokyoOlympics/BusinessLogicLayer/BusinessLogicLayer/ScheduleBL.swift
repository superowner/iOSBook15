//
//  ScheduleBL.swift
//  BusinessLogicLayer
//
//  Created by tonyguan on 2016/11/16.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import Foundation
import PersistenceLayer

public class ScheduleBL: NSObject {
    
    //查询所有数据方法
    public func readData() -> [String : [Schedule]] {
  
        let scheduleDAO = ScheduleDAO.sharedInstance
        let schedules  = scheduleDAO.findAll()
        var resDict = [String : [Schedule]]()
        
        let eventsDAO = EventsDAO.sharedInstance
        
        //延迟加载Events数据
        for schedule in schedules {
            
            let event = eventsDAO.findById(schedule.Event!)
            schedule.Event = event
            
            let allkey = resDict.keys
            
            //把NSMutableArray结构转化为NSMutableDictionary结构
            if allkey.contains(schedule.GameDate!) {
                var value = resDict[schedule.GameDate!]
                value?.append(schedule)
            } else {
                var value = [Schedule]()
                value.append(schedule)
                resDict[schedule.GameDate!] = value
            }
        }
        return resDict
    }
}
