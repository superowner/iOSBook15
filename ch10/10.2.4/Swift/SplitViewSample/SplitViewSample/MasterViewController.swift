//
//  MasterViewController.swift
//  SplitViewSample
//
//  Created by tonyguan on 2016/11/2.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = ["Blue View", "Yellow View"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Master";
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }

        let object = objects[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }

    // MARK: --表视图委托协议
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DetailViewController()
        controller.selectRow = indexPath.row
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
        let detailNavigationController = UINavigationController(rootViewController: controller)
        
        self.showDetailViewController(detailNavigationController, sender: self)
    }
}

