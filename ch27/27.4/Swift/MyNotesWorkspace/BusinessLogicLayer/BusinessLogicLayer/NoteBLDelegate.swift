//
//  NoteBLDelegate.swift
//  BusinessLogicLayer
//
//  Created by 关东升 on 2016-11-18.
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

public protocol NoteBLDelegate {
    
    //查询所有数据方法 成功
    func findAllNotesFinished(_ list: [Note])

    //查询所有数据方法 失败
    func findAllNotesFailed(_ error: Error)

    //插入Note方法 成功
    func createNoteFinished()

    //插入Note方法 失败
    func createNoteFailed(_ error: Error)

    //修改Note方法 成功
    func modifyNoteFinished()

    //修改Note方法 失败
    func modifyNoteFailed(_ error: Error)

    //删除Note方法 成功
    func removeNoteFinished()

    //删除Note方法 失败
    func removeNoteFailed(_ error: Error)

}
