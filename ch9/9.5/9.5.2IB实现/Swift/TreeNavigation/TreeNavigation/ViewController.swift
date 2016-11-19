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
        
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for:indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = self.listData[row] as? String
        
        return cell
    }
    
    //MARK: --场景过渡之前的预处理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "ShowSelectedProvince") {
            
            let indexPath = self.tableView.indexPathForSelectedRow! as IndexPath
            let selectedIndex = indexPath.row
            
            let citiesViewController = segue.destination as! CitiesViewController
            let selectName = self.listData[selectedIndex] as! String
            citiesViewController.listData = self.dictData[selectName] as! NSArray
            citiesViewController.title = selectName
        }
    }
}

