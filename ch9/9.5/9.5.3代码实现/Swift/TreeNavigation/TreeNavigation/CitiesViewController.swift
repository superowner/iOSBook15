//
//  CitiesViewController.swift
//  TreeNavigation
//
//  Created by tonyguan on 2016/10/31.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit


class CitiesViewController: UITableViewController {
    
    var listData: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    //MARK: --实现表视图委托协议方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedIndex = indexPath.row
        
        let dict = self.listData[selectedIndex] as! NSDictionary
        
        let detailViewController = DetailViewController()
        detailViewController.url = dict["url"] as! String
        detailViewController.title = dict["name"] as? String
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
