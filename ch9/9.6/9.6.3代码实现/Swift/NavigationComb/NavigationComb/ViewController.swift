//
//  ViewController.swift
//  NavigationComb
//
//  Created by tonyguan on 2016/10/31.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var dictData: NSDictionary!
    var listData: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        let navigationController = self.parent as! UINavigationController
        let selectProvinces = navigationController.tabBarItem.title!
        
        print(selectProvinces)
        
        if (selectProvinces == "黑龙江") {
            self.listData = self.dictData["黑龙江省"] as! NSArray
            self.navigationItem.title = "黑龙江省信息"
        } else if (selectProvinces == "吉林") {
            self.listData = self.dictData["吉林省"] as! NSArray
            self.navigationItem.title = "吉林省信息"
        } else {
            self.listData = self.dictData["辽宁省"] as! NSArray
            self.navigationItem.title = "辽宁省信息"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: --实现表视图数据源方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CellIdentifier"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:cellIdentifier)
        }
        
        let row = indexPath.row
        let dict = self.listData[row] as! NSDictionary
        
        cell.textLabel?.text = dict["name"] as? String
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    //MARK: --实现表视图委托方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedIndex = indexPath.row
        let dict = self.listData[selectedIndex] as! NSDictionary
        
        let detailViewController = DetailViewController()
        detailViewController.url = dict["url"] as! String
        detailViewController.title = dict["name"] as? String
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }

}

