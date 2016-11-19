//
//  NoteDAO.swift
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
import Alamofire

//定义DAO查询所有数据成功通知
public let	DaoFindAllFinishedNotification 	    = "DaoFindAllFinishedNotification"
//定义DAO查询所有数据失败通知
public let	DaoFindAllFailedNotification	    = "DaoFindAllFailedNotification"

//定义DAO通过ID查询数据成功通知
public let	DaoFindIdFinishedNotification	    = "DaoFindIdFinishedNotification"
//定义DAO通过ID查询数据失败通知
public let	DaoFindIdFailedNotification	        = "DaoFindIdFailedNotification"

//定义DAO插入数据成功通知
public let	DaoCreateFinishedNotification	    = "DaoCreateFinishedNotification"
//定义DAO插入数据失败通知
public let	DaoCreateFailedNotification	        = "DaoCreateFailedNotification"

//定义DAO删除数据成功通知
public let	DaoRemoveFinishedNotification	    = "DaoRemoveFinishedNotification"
//定义DAO删除数据失败通知
public let	DaoRemoveFailedNotification	        = "DaoRemoveFailedNotification"

//定义DAO修改数据成功通知
public let	DaoModifyFinishedNotification	    = "DaoModifyFinishedNotification"
//定义DAO修改数据失败通知
public let	DaoModifyFailedNotification	        = "DaoModifyFailedNotification"

let WEBSERVICE_URL = "http://www.51work6.com/service/mynotes/WebService.php"
let USER_ID = "test@51work6.com"

public class NoteDAO: NSObject {
    
    public static let sharedInstance: NoteDAO = {
        let instance = NoteDAO()
        return instance
    }()
    
    //插入Note方法
    public func create(_ model: Note) {
        
        let params = ["email": USER_ID, "type": "JSON", "action": "add", "date": model.date, "content": model.content]
        
        Alamofire.request(WEBSERVICE_URL, method: .post, parameters: params)
            .responseJSON(completionHandler: {
                response in
                if let error = response.result.error {
                    NotificationCenter.default
                        .post(name: Notification.Name(rawValue: DaoCreateFailedNotification),
                              object: error)
                } else {
                    
                    let resDict = response.result.value as! [String: AnyObject]
                    let resultCode = resDict["ResultCode"] as! Int
                    
                    if resultCode >= 0 {
                        NotificationCenter.default
                            .post(name: Notification.Name(rawValue: DaoCreateFinishedNotification),
                                  object: nil)
                    } else {
                        let message = resultCode.errorMessage
                        let userInfo = [NSLocalizedDescriptionKey: message]
                        let err = NSError(domain: "DAO", code: resultCode, userInfo: userInfo)
                        NotificationCenter.default
                            .post(name: Notification.Name(rawValue: DaoCreateFailedNotification),
                                  object: err)
                    }
                }
            })
    }
    
    //删除Note方法
    public func remove(_ model: Note) {
        
        let params = ["email": USER_ID, "type": "JSON", "action": "remove", "id": model.ID]
        
        Alamofire.request(WEBSERVICE_URL, method: .post, parameters: params)
            .responseJSON(completionHandler: {
                response in
                if let error = response.result.error {
                    NotificationCenter.default
                        .post(name: Notification.Name(rawValue: DaoRemoveFailedNotification),
                              object: error)
                } else {
                    let resDict = response.result.value as! [String: AnyObject]
                    let resultCode = resDict["ResultCode"] as! Int
                    
                    if resultCode >= 0 {
                        NotificationCenter.default
                            .post(name: Notification.Name(rawValue: DaoRemoveFinishedNotification),
                                  object: nil)
                    } else {
                        let message = resultCode.errorMessage
                        let userInfo = [NSLocalizedDescriptionKey: message]
                        let err = NSError(domain: "DAO", code: resultCode, userInfo: userInfo)
                        NotificationCenter.default
                            .post(name: Notification.Name(rawValue: DaoRemoveFailedNotification),
                                  object: err)
                    }
                }
            })
    }
    
    //修改Note方法
    public func modify(_ model: Note) {
        
        let params = ["email": USER_ID, "type": "JSON", "action": "modify", "id": model.ID, "date": model.date, "content": model.content]
        
        Alamofire.request(WEBSERVICE_URL, method: .post, parameters: params)
            .responseJSON(completionHandler: {
                response in
                if let error = response.result.error {
                    NotificationCenter.default
                        .post(name: Notification.Name(rawValue: DaoModifyFailedNotification),
                              object: error)
                } else {
                    let resDict = response.result.value as! [String: AnyObject]
                    let resultCode = resDict["ResultCode"] as! Int
                    
                    if resultCode >= 0 {
                        NotificationCenter.default
                            .post(name: Notification.Name(rawValue: DaoModifyFinishedNotification),
                                  object: nil)
                    } else {
                        let message = resultCode.errorMessage
                        let userInfo = [NSLocalizedDescriptionKey: message]
                        let err = NSError(domain: "DAO", code: resultCode, userInfo: userInfo)
                        NotificationCenter.default
                            .post(name: Notification.Name(rawValue: DaoModifyFailedNotification),
                                  object: err)
                    }
                }
            })
    }
    
    //查询所有数据方法
    public func findAll() {
        
        let params = ["email": USER_ID, "type": "JSON", "action": "query"]
        
        Alamofire.request(WEBSERVICE_URL, method: .post, parameters: params)
            .responseJSON(completionHandler: {
                response in
                if let error = response.result.error {
                    NotificationCenter.default
                        .post(name: Notification.Name(rawValue: DaoFindAllFailedNotification),
                              object: error)
                } else {
                    let resDict = response.result.value as! [String: AnyObject]
                    let resultCode = resDict["ResultCode"] as! Int
                    
                    if resultCode >= 0 {
                        //从服务器返回数据
                        let listDict = resDict["Record"] as! [AnyObject]
                        
                        //准备返回给上层数据
                        var listData = [Note]()
                        
                        for dic in listDict {
                            let note = Note()
                            let _id  = dic["ID"] as! Int
                            note.ID = String(_id)
                            note.date = dic["CDate"] as! String
                            note.content = dic["Content"] as! String
                            
                            listData.append(note)
                        }
                        NotificationCenter.default
                            .post(name: Notification.Name(rawValue: DaoFindAllFinishedNotification),
                                  object: listData)
                        
                    } else {
                        let message = resultCode.errorMessage
                        let userInfo = [NSLocalizedDescriptionKey: message]
                        let err = NSError(domain: "DAO", code: resultCode, userInfo: userInfo)
                        NotificationCenter.default
                            .post(name: Notification.Name(rawValue: DaoFindAllFailedNotification),
                                  object: err)
                    }
                }
            })
    }
    
    //按照主键查询数据方法
    public func findById(_ model: Note) {
        
        let params = ["email": USER_ID, "type": "JSON", "action": "query", "id": model.ID]
        
        Alamofire.request(WEBSERVICE_URL, method: .post, parameters: params)
            .responseJSON(completionHandler: {
                response in
                if let error = response.result.error {
                    NotificationCenter.default
                        .post(name: Notification.Name(rawValue: DaoFindIdFailedNotification),
                              object: error)
                } else {
                    let resDict = response.result.value as! [String: AnyObject]
                    let resultCode = resDict["ResultCode"] as! Int
                    
                    if resultCode >= 0 {
                        //从服务器返回数据
                        let listDict = resDict["Record"] as! NSMutableArray
                        
                        //准备返回给上层数据
                        let dic = listDict.firstObject as! [String: AnyObject]
                        
                        let note = Note()
                        let _id  = dic["ID"] as! Int
                        note.ID = String(_id)
                        note.date = dic["CDate"] as! String
                        note.content = dic["Content"] as! String
                        
                        NotificationCenter.default
                            .post(name: Notification.Name(rawValue: DaoFindIdFinishedNotification),
                                  object: note)
                        
                    } else {
                        let message = resultCode.errorMessage
                        let userInfo = [NSLocalizedDescriptionKey: message]
                        let err = NSError(domain: "DAO", code: resultCode, userInfo: userInfo)
                        NotificationCenter.default
                            .post(name: Notification.Name(rawValue: DaoFindIdFailedNotification),
                                  object: err)
                    }
                }
            })
    }
    
}
