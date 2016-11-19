//
//  EventCollectionViewCell.swift
//  CollectionViewSample
//
//  Created by tonyguan on 2016/10/23.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /// 1.添加ImageView
        let cellWidth: CGFloat = self.frame.size.width
        
        let imageViewWidth: CGFloat = 101
        let imageViewHeight: CGFloat = 101
        let imageViewTopView: CGFloat = 15
        
        /// 1.添加ImageView
        self.imageView = UIImageView(frame: CGRect(x: (cellWidth - imageViewWidth) / 2, y: imageViewTopView, width: imageViewWidth, height: imageViewHeight))
        
        self.addSubview(self.imageView)
        
        /// 2.添加标签
        let labelWidth: CGFloat = 101
        let labelHeight: CGFloat = 16
        let labelTopView: CGFloat = 120
        
        self.label = UILabel(frame: CGRect(x: (cellWidth - labelWidth) / 2, y: labelTopView, width: labelWidth, height: labelHeight))
        
        //字体左右居中
        self.label.textAlignment = .center
        //设置字体
        self.label.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(self.label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
