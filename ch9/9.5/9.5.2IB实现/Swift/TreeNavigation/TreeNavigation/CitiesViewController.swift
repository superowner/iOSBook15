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
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for:indexPath)
        
        let row = indexPath.row
        let dict = self.listData[row] as! NSDictionary
        cell.textLabel?.text = dict["name"] as? String
        
        return cell
    }
    
    //MARK: --选择表视图行时触发
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "ShowSelectedCity") {
            
            let indexPath = self.tableView.indexPathForSelectedRow! as IndexPath
            let selectedIndex = indexPath.row
            
            let dict = self.listData[selectedIndex] as! NSDictionary
            
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.url = dict["url"] as! String
            detailViewController.title = dict["name"] as? String
        }
        
    }

}
