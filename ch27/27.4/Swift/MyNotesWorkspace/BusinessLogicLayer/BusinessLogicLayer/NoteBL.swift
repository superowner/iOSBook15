//
//  NoteBL.swift
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

public class NoteBL: NoteDAODelegate {
   
    public var delegate: NoteBLDelegate!
    
    public init() {
    }
    
    //插入Note方法
    public func createNote(_ model: Note) {
        let dao = NoteDAO.sharedInstance
        dao.delegate = self
        dao.create(model)
    }
    
    //修改Note方法
    public func modifyNote(_ model: Note) {
        let dao = NoteDAO.sharedInstance
        dao.delegate = self
        dao.modify(model)
    }
    
    //删除Note方法
    public func removeNote(_ model: Note) {
        let dao = NoteDAO.sharedInstance
        dao.delegate = self
        dao.remove(model)
    }
    
    //查询所用数据方法
    public func findAllNotes() {
        let dao = NoteDAO.sharedInstance
        dao.delegate = self
        dao.findAll()
    }
    
    //MARK: --实现NoteDAODelegate 委托方法
    //查询所有数据方法 成功
    public func findAllFinished(_ list: [Note]) {
        self.delegate.findAllNotesFinished(list)
    }
    
    //查询所有数据方法 失败
    public func findAllFailed(_ error: Error) {
        self.delegate.findAllNotesFailed(error)
    }
    
    //插入Note方法 成功
    public func createFinished() {
        self.delegate.createNoteFinished()
    }
    
    //插入Note方法 失败
    public func createFailed(_ error: Error) {
        self.delegate.createNoteFailed(error)
    }
    
    //删除Note方法 成功
    public func removeFinished() {
        self.delegate.removeNoteFinished()
    }
    //删除Note方法 失败
    public func removeFailed(_ error: Error) {
        self.delegate.removeNoteFailed(error)
    }
    
    //修改Note方法 成功
    public func modifyFinished() {
        self.delegate.modifyNoteFinished()
    }
    //修改Note方法 失败
    public func modifyFailed(_ error: Error) {
        self.delegate.modifyNoteFailed(error)
    }
    
    //以下是不需要实现的方法
    public func findByIdFinished(_ model: Note) {}
    public func findByIdFailed(_ error: Error) {}
    
}
