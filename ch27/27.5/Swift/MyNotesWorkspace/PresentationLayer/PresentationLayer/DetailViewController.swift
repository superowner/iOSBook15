//
//  DetailViewController.swift
//  PresentationLayer
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

import UIKit
import BusinessLogicLayer
import PersistenceLayer

class DetailViewController: UIViewController, UITextViewDelegate {
    
    //业务逻辑对象BL
    var bl: NoteBL!
    
    @IBOutlet weak var txtView: UITextView!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let note: Note = self.detailItem as? Note {
            let content = note.content as String?
            if self.txtView != nil {
                self.txtView.text = content
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        self.bl = NoteBL()
        self.txtView.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(modifyNoteFinished(_:)),
                                               name: NSNotification.Name(rawValue: BLModifyFinishedNotification),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(modifyNoteFailed(_:)),
                                               name: NSNotification.Name(rawValue: BLModifyFailedNotification),
                                               object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func onclickSave(_ sender: AnyObject) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate  =  dateFormatter.string(from: Date())
        
        let note = self.detailItem as! Note
        note.date = strDate
        note.content = self.txtView.text
        
        self.bl.modifyNote(note)
        
        self.txtView.resignFirstResponder()
    }
    
    // MARK:- 处理通知
    //修改Note方法 成功
    func modifyNoteFinished(_ notification: Notification) {
        let alertController: UIAlertController = UIAlertController(title: "操作信息", message: "修改成功。", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) {
            (alertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
    }
    
    //修改Note方法 失败
    func modifyNoteFailed(_ notification: Notification) {
        
        let error = notification.object as! NSError
        let errorStr = error.localizedDescription
        
        let alertController: UIAlertController = UIAlertController(title: "操作信息", message: errorStr, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) {
            (alertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
    }
}

