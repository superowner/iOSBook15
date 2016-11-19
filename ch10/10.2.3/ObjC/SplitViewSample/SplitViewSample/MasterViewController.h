//
//  MasterViewController.h
//  SplitViewSample
//
//  Created by tonyguan on 2016/11/1.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

