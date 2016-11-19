//
//  EventsViewCell.swift
//  TokyoOlympics
//
//  Created by tonyguan on 2016/11/17.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class EventsViewCell: UICollectionViewCell {

    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //单元格的宽度
        let cellWidth: CGFloat = self.frame.size.width
        
        /// 1.添加ImageView
        let imageViewWidth: CGFloat = 100
        let imageViewHeight: CGFloat = 100
        let imageViewTopView: CGFloat = 0
        
        self.imageView = UIImageView(frame: CGRect(x: (cellWidth - imageViewWidth) / 2, y: imageViewTopView, width: imageViewWidth, height: imageViewHeight))
        
        self.addSubview(self.imageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
