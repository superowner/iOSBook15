//
//  CustomCell.swift
//  CustomCell
//
//  Created by tonyguan on 2016/10/24.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
