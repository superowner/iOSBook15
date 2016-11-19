//
//  EventCollectionViewCell.m
//  CollectionViewSample
//
//  Created by tonyguan on 2016/10/23.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "EventCollectionViewCell.h"

@implementation EventCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        //单元格的宽度
        CGFloat cellWidth = self.frame.size.width;
        
        CGFloat imageViewWidth = 101;
        CGFloat imageViewHeight = 101;
        CGFloat imageViewTopView = 15;
        
        /// 1.添加ImageView
        self.imageView = [[UIImageView alloc] initWithFrame: CGRectMake((cellWidth - imageViewWidth) / 2, imageViewTopView, imageViewWidth, imageViewHeight)];
        
        [self addSubview:self.imageView];
        
        /// 2.添加标签
        CGFloat labelWidth = 101;
        CGFloat labelHeight = 16;
        CGFloat labelTopView = 120;
        self.label = [[UILabel alloc] initWithFrame:CGRectMake((cellWidth - labelWidth) / 2, labelTopView, labelWidth, labelHeight)];
        //字体左右居中
        self.label.textAlignment = NSTextAlignmentCenter;
        //设置字体
        self.label.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.label];
        
    }
    return self;
}

@end
