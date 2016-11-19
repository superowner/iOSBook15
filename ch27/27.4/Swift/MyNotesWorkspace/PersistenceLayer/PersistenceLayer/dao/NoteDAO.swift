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

let WEBSERVICE_URL = "http://www.51work6.com/service/mynotes/WebService.php"
let USER_ID = "test@51work6.com"

public class NoteDAO: NSObject {
    
    public var delegate: NoteDAODelegate!
    
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
                    self.delegate.createFailed(error)
                } else {
                    
                    let resDict = response.result.value as! [String: AnyObject]
                    let resultCode = resDict["ResultCode"] as! Int
                    
                    if resultCode >= 0 {
                        self.delegate.createFinished()
                    } else {
                        let message = resultCode.errorMessage
                        let userInfo = [NSLocalizedDescriptionKey: message]
                        let err = NSError(domain: "DAO", code: resultCode, userInfo: userInfo)
                        self.delegate.createFailed(err)
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
                    self.delegate.removeFailed(error)
                } else {
                    let resDict = response.result.value as! [String: AnyObject]
                    let resultCode = resDict["ResultCode"] as! Int
                    
                    if resultCode >= 0 {
                        self.delegate.removeFinished()
                    } else {
                        let message = resultCode.errorMessage
                        let userInfo = [NSLocalizedDescriptionKey: message]
                        let err = NSError(domain: "DAO", code: resultCode, userInfo: userInfo)
                        self.delegate.removeFailed(err)
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
                    self.delegate.modifyFailed(error)
                } else {
                    let resDict = response.result.value as! [String: AnyObject]
                    let resultCode = resDict["ResultCode"] as! Int
                    
                    if resultCode >= 0 {
                        self.delegate.modifyFinished()
                    } else {
                        let message = resultCode.errorMessage
                        let userInfo = [NSLocalizedDescriptionKey: message]
                        let err = NSError(domain: "DAO", code: resultCode, userInfo: userInfo)
                        self.delegate.modifyFailed(err)
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
                    self.delegate.findAllFailed(error)
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
                        self.delegate.findAllFinished(listData)
                        
                    } else {
                        let message = resultCode.errorMessage
                        let userInfo = [NSLocalizedDescriptionKey: message]
                        let err = NSError(domain: "DAO", code: resultCode, userInfo: userInfo)
                        self.delegate.findAllFailed(err)
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
                    self.delegate.findAllFailed(error)
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
                        
                        self.delegate.findByIdFinished(note)
                        
                    } else {
                        let message = resultCode.errorMessage
                        let userInfo = [NSLocalizedDescriptionKey: message]
                        let err = NSError(domain: "DAO", code: resultCode, userInfo: userInfo)
                        self.delegate.findByIdFailed(err)
                    }
                }
            })
    }
    
}
