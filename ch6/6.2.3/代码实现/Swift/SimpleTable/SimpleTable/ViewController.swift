//
//  ViewController.swift
//  SimpleTable
//
//  Created by tonyguan on 2016/10/23.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

let CellIdentifier = "CellIdentifier"

class ViewController: UITableViewController {

    var listTeams : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        //获取属性列表文件中的全部数据
        self.listTeams = NSArray(contentsOfFile: plistPath!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: --UITableViewDataSource 协议方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:CellIdentifier)
        }
        
        let row = (indexPath as NSIndexPath).row
        
        let rowDict = self.listTeams[row] as! NSDictionary
        cell.textLabel?.text = rowDict["name"] as? String
        
        let imagePath = String(format: "%@.png", rowDict["image"] as! String)
        cell.imageView?.image = UIImage(named: imagePath)
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
