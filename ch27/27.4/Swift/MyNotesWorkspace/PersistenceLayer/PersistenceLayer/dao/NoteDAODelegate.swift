//
//  NoteDAODelegate.swift
//  PersistenceLayer
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

public protocol NoteDAODelegate {

    //查询所有数据方法 成功
    func findAllFinished(_ list: [Note])

    //查询所有数据方法 失败
    func findAllFailed(_ error: Error)

    //按照主键查询数据方法 成功
    func findByIdFinished(_ model: Note)

    //按照主键查询数据方法 失败
    func findByIdFailed(_ error: Error)

    //插入Note方法 成功
    func createFinished()

    //插入Note方法 失败
    func createFailed(_ error: Error)

    //删除Note方法 成功
    func removeFinished()

    //删除Note方法 失败
    func removeFailed(_ error: Error)

    //修改Note方法 成功
    func modifyFinished()

    //修改Note方法 失败
    func modifyFailed(_ error: Error)

}
