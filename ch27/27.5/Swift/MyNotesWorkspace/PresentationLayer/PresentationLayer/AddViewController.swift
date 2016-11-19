//
//  AddViewController.swift
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

class AddViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var txtView: UITextView!
    
    //业务逻辑对象BL
    var bl: NoteBL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bl = NoteBL()
        self.txtView.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(createNoteFinished(_:)),
                                               name: NSNotification.Name(rawValue: BLCreateNoteFinishedNotification),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(createNoteFailed(_:)),
                                               name: NSNotification.Name(rawValue: BLCreateNoteFailedNotification),
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
        
        let note = Note()
        note.date = strDate
        note.content = self.txtView.text
        self.bl.createNote(note)
        
        self.txtView.resignFirstResponder()

    }

    @IBAction func onclickCancel(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    // MARK: --处理通知
    //插入Note方法 成功
    func createNoteFinished(_ notification: Notification) {
        
        let alertController: UIAlertController = UIAlertController(title: "操作信息", message: "插入成功。", preferredStyle: UIAlertControllerStyle.alert)
        
        let noAction = UIAlertAction(title: "返回", style: .cancel) {
            (alertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        let yesAction = UIAlertAction(title: "继续", style: .default) {
            (alertAction) -> Void in
            self.txtView.text = ""
            self.txtView.becomeFirstResponder()
        }
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    //插入Note方法 失败
    func createNoteFailed(_ notification: Notification) {
        
        let error = notification.object as! NSError
        let errorStr = error.localizedDescription
        
        let alertController: UIAlertController = UIAlertController(title: "操作信息", message: errorStr, preferredStyle: UIAlertControllerStyle.alert)
        
        let noAction = UIAlertAction(title: "返回", style: .cancel) {
            (alertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        let yesAction = UIAlertAction(title: "继续", style: .default) {
            (alertAction) -> Void in
            self.txtView.text = ""
            self.txtView.becomeFirstResponder()
        }
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
    }

}
