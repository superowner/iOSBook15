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

//定义BL查询所有数据成功通知
public let	BLFindAllFinishedNotification	    = "BLFindAllFinishedNotification"
//定义BL查询所有数据失败通知
public let	BLFindAllFailedNotification	        = "BLFindAllFailedNotification"

//定义BL插入数据成功通知
public let	BLCreateNoteFinishedNotification	= "BLCreateNoteFinishedNotification"
//定义BL插入数据失败通知
public let	BLCreateNoteFailedNotification	    = "BLCreateNoteFailedNotification"

//定义BL删除数据成功通知
public let	BLRemoveFinishedNotification	    = "BLRemoveFinishedNotification"
//定义BL删除数据失败通知
public let	BLRemoveFailedNotification	        = "BLRemoveFailedNotification"

//定义BL修改数据成功通知
public let	BLModifyFinishedNotification	    = "BLModifyFinishedNotification"
//定义BL修改数据失败通知
public let	BLModifyFailedNotification	        = "BLModifyFailedNotification"

public class NoteBL : NSObject {
    
    public override init() {
    }
    
    //插入Note方法
    public func createNote(_ model: Note) {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(createFinished(_:)),
                                               name: NSNotification.Name(rawValue: DaoCreateFinishedNotification),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(createFailed(_:)),
                                               name: NSNotification.Name(rawValue: DaoCreateFailedNotification),
                                               object: nil)
        
        let dao = NoteDAO.sharedInstance
        dao.create(model)
    }
    
    //修改Note方法
    public func modifyNote(_ model: Note) {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(modifyFinished(_:)),
                                               name: NSNotification.Name(rawValue: DaoModifyFinishedNotification),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(modifyFailed(_:)),
                                               name: NSNotification.Name(rawValue: DaoModifyFailedNotification),
                                               object: nil)
        
        let dao = NoteDAO.sharedInstance
        dao.modify(model)
    }
    
    //删除Note方法
    public func removeNote(_ model: Note) {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(removeFinished(_:)),
                                               name: NSNotification.Name(rawValue: DaoRemoveFinishedNotification),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(removeFailed(_:)),
                                               name: NSNotification.Name(rawValue: DaoRemoveFailedNotification),
                                               object: nil)
        
        let dao = NoteDAO.sharedInstance
        dao.remove(model)
    }
    
    //查询所用数据方法
    public func findAllNotes() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(findAllFinished(_:)),
                                               name: NSNotification.Name(rawValue: DaoFindAllFinishedNotification),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(findAllFailed(_:)),
                                               name: NSNotification.Name(rawValue: DaoFindAllFailedNotification),
                                               object: nil)
        
        let dao = NoteDAO.sharedInstance
        dao.findAll()
    }
    
    //MARK: --通知回调方法
    //查询所有数据方法 成功
    func findAllFinished(_ notification: Notification) {
        let resList = notification.object
        NotificationCenter.default.post(name: Notification.Name(rawValue: BLFindAllFinishedNotification), object: resList)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoFindAllFinishedNotification), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoFindAllFailedNotification), object: nil)
    }
    
    //查询所有数据方法 失败
    func findAllFailed(_ notification: Notification) {
        let error = notification.object
        NotificationCenter.default.post(name: Notification.Name(rawValue: BLFindAllFailedNotification), object: error)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoFindAllFinishedNotification), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoFindAllFailedNotification), object: nil)
    }
    
    //插入Note方法 成功
    func createFinished(_ notification: Notification) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: BLCreateNoteFinishedNotification), object: nil)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoCreateFinishedNotification), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoCreateFailedNotification), object: nil)
    }
    
    //插入Note方法 失败
    func createFailed(_ notification: Notification) {
        let error = notification.object
        NotificationCenter.default.post(name: Notification.Name(rawValue: BLCreateNoteFailedNotification), object: error)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoCreateFinishedNotification), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoCreateFailedNotification), object: nil)
    }
    
    //删除Note方法 成功
    func removeFinished(_ notification: Notification) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: BLRemoveFinishedNotification), object: nil)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoRemoveFinishedNotification), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoRemoveFailedNotification), object: nil)
    }
    //删除Note方法 失败
    func removeFailed(_ notification: Notification){
        let error = notification.object
        NotificationCenter.default.post(name: Notification.Name(rawValue: BLRemoveFailedNotification), object: error)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoRemoveFinishedNotification), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoRemoveFailedNotification), object: nil)
    }
    
    //修改Note方法 成功
    func modifyFinished(_ notification: Notification) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: BLModifyFinishedNotification), object: nil)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoModifyFinishedNotification), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoModifyFailedNotification), object: nil)
    }
    
    //修改Note方法 失败
    func modifyFailed(_ notification: Notification) {
        let error = notification.object
        NotificationCenter.default.post(name: Notification.Name(rawValue: BLModifyFailedNotification), object: error)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoModifyFinishedNotification), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: DaoModifyFailedNotification), object: nil)
    }
    
}
