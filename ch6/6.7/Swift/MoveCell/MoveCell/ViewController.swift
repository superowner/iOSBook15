//
//  ViewController.swift
//  MoveCell
//
//  Created by tonyguan on 2016/10/25.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var listTeams : NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航栏
        self.navigationItem.rightBarButtonItem =  self.editButtonItem
        self.navigationItem.title = "单元格移动"
        self.listTeams = NSMutableArray(array: ["黑龙江", "吉林", "辽宁"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: --UIViewController生命周期方法，用于响应视图编辑状态变化
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: true)
    }
    
    // MARK: --实现UITableViewSource数据源方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CellIdentifier"
        
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.listTeams[(indexPath as NSIndexPath).row] as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let stringToMove = self.listTeams[(sourceIndexPath as NSIndexPath).row] as! String
        
        self.listTeams.removeObject(at: (sourceIndexPath as NSIndexPath).row)
        self.listTeams.insert(stringToMove, at: (destinationIndexPath as NSIndexPath).row)
    }
    
    // MARK: --UITableViewDelegate协议方法
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }

}

