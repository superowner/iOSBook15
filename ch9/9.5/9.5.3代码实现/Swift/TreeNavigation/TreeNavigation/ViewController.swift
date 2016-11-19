//
//  ViewController.swift
//  TreeNavigation
//
//  Created by tonyguan on 2016/10/30.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dictData: NSDictionary!
    var listData: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        self.listData = self.dictData.allKeys as NSArray
        self.title = "省份信息"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: --实现表视图数据源方法
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
        cell.textLabel?.text = self.listData[row] as? String
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    //MARK: --实现表视图委托方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedIndex = indexPath.row
        
        let citiesViewController = CitiesViewController()
        let selectName = self.listData[selectedIndex] as! String
        citiesViewController.listData = self.dictData[selectName] as! NSArray
        citiesViewController.title = selectName
        
        self.navigationController?.pushViewController(citiesViewController, animated: true)
    }
}
