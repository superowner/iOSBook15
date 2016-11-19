//
//  NoteDAO.swift
//  MyNotes
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

let FILE_NAME = "NotesList.archive"
let ARCHIVE_KEY = "NotesList"

public class NoteDAO {
    
    //私有的DateFormatter属性
    private var dateFormatter = DateFormatter()
    //私有的沙箱目录中属性列表文件路径
    private var plistFilePath: String!

    public static let sharedInstance: NoteDAO = {
        let instance = NoteDAO()

        //初始化沙箱目录中属性列表文件路径
        instance.plistFilePath = instance.applicationDocumentsDirectoryFile()
        //初始化DateFormatter
        instance.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //初始化属性列表文件
        instance.createEditableCopyOfDatabaseIfNeeded()

        return instance
    }()

    //初始化文件
    private func createEditableCopyOfDatabaseIfNeeded() {

        let fileManager = FileManager.default
        let dbexits = fileManager.fileExists(atPath: self.plistFilePath)
        if (!dbexits) {

            //添加一些测试数据
            let date1: Date = self.dateFormatter.date(from: "2017-01-01 16:01:03")!
            let note1: Note = Note(date: date1, content: "Welcome to MyNote.")

            let date2: Date = self.dateFormatter.date(from: "2017-01-02 8:01:0")!
            let note2: Note = Note(date: date2, content: "欢迎使用MyNote。")

            let array = NSMutableArray()
            array.add(note1)
            array.add(note2)

            let theData = NSMutableData()
            let archiver = NSKeyedArchiver(forWritingWith: theData)
            archiver.encode(array, forKey: ARCHIVE_KEY)
            archiver.finishEncoding()

            theData.write(toFile: self.plistFilePath, atomically: true)
        }

    }

    private func applicationDocumentsDirectoryFile() -> String {
        let documentDirectory: NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let path = (documentDirectory[0] as AnyObject).appendingPathComponent(FILE_NAME) as String
        return path
    }

    //插入Note方法
    public func create(_ model: Note) -> Int {

        let array = self.findAll()!
        array.add(model)

        let theData = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: theData)
        archiver.encode(array, forKey: ARCHIVE_KEY)
        archiver.finishEncoding()

        theData.write(toFile: self.plistFilePath, atomically: true)

        return 0
    }

    //删除Note方法
    public func remove(_ model: Note) -> Int {

        let array = self.findAll()!

        for item in array {

            let note = item as! Note

            //比较日期主键是否相等
            if note.date == model.date {

                array.remove(note)

                let theData = NSMutableData()
                let archiver = NSKeyedArchiver(forWritingWith: theData)
                archiver.encode(array, forKey: ARCHIVE_KEY)
                archiver.finishEncoding()
                theData.write(toFile: self.plistFilePath, atomically: true)

                break
            }
        }
        return 0
    }

    //修改Note方法
    public func modify(_ model: Note) -> Int {

        let array = self.findAll()!

        for item in array {

            let note = item as! Note

            //比较日期主键是否相等
            if note.date == model.date {

                note.content = model.content

                let theData = NSMutableData()
                let archiver = NSKeyedArchiver(forWritingWith: theData)
                archiver.encode(array, forKey: ARCHIVE_KEY)
                archiver.finishEncoding()
                theData.write(toFile: self.plistFilePath, atomically: true)

                break
            }
        }
        return 0
    }
    //查询所有数据方法
    public func findAll() -> NSMutableArray? {

        let theData = try! Data(contentsOf: URL(fileURLWithPath: self.plistFilePath))

        if theData.count > 0 {
            let archiver = NSKeyedUnarchiver(forReadingWith: theData)
            let listData = archiver.decodeObject(forKey: ARCHIVE_KEY) as! NSMutableArray
            archiver.finishDecoding()

            return listData
        }

        return nil
    }

    //按照主键查询数据方法
    public func findById(_ model: Note) -> Note? {

        let array = NSMutableArray(contentsOfFile: self.plistFilePath)!

        for item in array {

            let dict = item as! NSDictionary
            let strDate = dict["date"] as! String
            let date = dateFormatter.date(from: strDate)!
            let content = dict["content"] as! String

            //比较日期主键是否相等
            if date == model.date as Date {
                let note = Note(date: date, content: content)
                return note
            }
        }
        return nil
    }


}
