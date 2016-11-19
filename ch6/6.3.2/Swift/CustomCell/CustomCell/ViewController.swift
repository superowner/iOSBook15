//
//  ViewController.swift
//  CustomCell
//
//  Created by tonyguan on 2016/10/24.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

let cellIdentifier = "CellIdentifier"

class ViewController: UITableViewController {

    var listTeams : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        //获取属性列表文件中的全部数据
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        
        //设置可重用单元格标识与单元格类型
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: --UITableViewDataSource 协议方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustomCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for:indexPath) as? CustomCell
        
        let row = (indexPath as NSIndexPath).row
        
        let rowDict = self.listTeams[row] as! NSDictionary
        cell.myLabel.text = rowDict["name"] as? String
        
        let imageFile = rowDict["image"] as? String
        let imagePath = String(format: "%@.png", imageFile!)
        
        cell.myImageView.image = UIImage(named: imagePath)
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

