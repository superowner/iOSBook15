//
//  MasterViewController.swift
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

class MasterViewController: UITableViewController, NoteBLDelegate {
    
    var detailViewController: DetailViewController? = nil
    
    //保存数据列表
    var listData = [Note]()
    //业务逻辑对象BL
    var bl: NoteBL!
    //删除数据索引
    var deletedIndex: Int!
    //删除数据
    var deletedNote: Note!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem


        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }

        self.bl = NoteBL()
        self.bl.delegate = self
        self.bl.findAllNotes()
        
        //初始化UIRefreshControl
        let rc = UIRefreshControl()
        rc.attributedTitle = NSAttributedString(string: "下拉刷新")
        rc.addTarget(self, action: #selector(refreshTableView), for: UIControlEvents.valueChanged)
        self.refreshControl = rc

    }
    
    func refreshTableView() {
        
        if (self.refreshControl!.isRefreshing == true) {
            self.refreshControl!.attributedTitle = NSAttributedString(string: "加载中...")
            //查询所有的数据
            self.bl.findAllNotes()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let note = self.listData[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = note
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let note = self.listData[indexPath.row]
        cell.textLabel!.text = note.content
        cell.detailTextLabel!.text = note.date

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.deletedIndex = indexPath.row
            self.deletedNote = self.listData[indexPath.row]
            self.bl.removeNote(self.deletedNote)
        }
    }

    // MARK:--实现NoteBLDelegate委托方法
    //查询所有数据方法 成功
    func findAllNotesFinished(_ list: [Note]) {
        self.listData = list
        self.tableView.reloadData()
        
        if self.refreshControl != nil {
            self.refreshControl!.endRefreshing()
            self.refreshControl!.attributedTitle = NSAttributedString(string: "下拉刷新")
        }
    }
    
    //查询所有数据方法 失败
    func findAllNotesFailed(_ error: Error) {
        
        let errorStr = error.localizedDescription
        let alertController: UIAlertController = UIAlertController(title: "操作信息", message: errorStr, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) {
            (alertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
        
        if self.refreshControl != nil {
            self.refreshControl!.endRefreshing()
            self.refreshControl!.attributedTitle = NSAttributedString(string: "下拉刷新")
        }
    }
    
    
    //删除Note方法 成功
    func removeNoteFinished() {
        
        let alertController: UIAlertController = UIAlertController(title: "操作信息", message: "删除成功。", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) {
            (alertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
        
        self.listData.remove(at: self.deletedIndex)
        
        self.tableView.reloadData()
    }
    
    //删除Note方法 失败
    func removeNoteFailed(_ error: Error) {
        
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
    
    //以下是不需要实现的方法
    public func modifyNoteFailed(_ error: Error) {}
    public func modifyNoteFinished() {}
    public func createNoteFailed(_ error: Error) {}
    public func createNoteFinished() {}
    
}

