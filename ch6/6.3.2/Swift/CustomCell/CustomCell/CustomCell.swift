//
//  CustomCell.swift
//  CustomCell
//
//  Created by tonyguan on 2016/10/24.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    var myLabel: UILabel!
    var myImageView: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //单元格的宽度
        //let cellWidth: CGFloat = self.frame.size.width
        let cellHeight: CGFloat = self.frame.size.height
        
        let imageViewWidth: CGFloat = 39
        let imageViewHeight: CGFloat = 28
        let imageViewLeftView: CGFloat = 300
        
        
        /// 1.添加ImageView
        self.myImageView = UIImageView(frame: CGRect(x: imageViewLeftView,  y: (cellHeight - imageViewHeight) / 2, width: imageViewWidth, height: imageViewHeight))
        
        self.addSubview(self.myImageView)
        
        /// 2.添加标签
        let labelWidth: CGFloat = 120
        let labelHeight: CGFloat = 21
        let labelLeftView: CGFloat = 15
        
        self.myLabel = UILabel(frame: CGRect(x: labelLeftView, y: (cellHeight - labelHeight) / 2, width: labelWidth, height: labelHeight))
        
        self.addSubview(self.myLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
