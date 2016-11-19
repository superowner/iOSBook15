//
//  CustomCell.m
//  CustomCell
//
//  Created by tonyguan on 2016/10/24.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        //单元格的宽度
        //CGFloat cellWidth = self.frame.size.width;
        CGFloat cellHeight = self.frame.size.height;
        
        CGFloat imageViewWidth = 39;
        CGFloat imageViewHeight = 28;
        CGFloat imageViewLeftView = 300;
        
        /// 1.添加ImageView
        self.myImageView = [[UIImageView alloc] initWithFrame: CGRectMake(imageViewLeftView,  (cellHeight - imageViewHeight) / 2, imageViewWidth, imageViewHeight)];
        
        [self addSubview:self.myImageView];
        
        /// 2.添加标签
        CGFloat labelWidth = 120;
        CGFloat labelHeight = 21;
        CGFloat labelLeftView = 15;
        self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelLeftView, (cellHeight - labelHeight) / 2, labelWidth, labelHeight)];
        
        [self addSubview:self.myLabel];
    }
    
    return self;
}

@end
