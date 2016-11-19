//
//  EventsDetailViewController.h
//  TokyoOlympics
//
//  Created by tonyguan on 2016/11/17.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PersistenceLayer/Events.h>

@interface EventsDetailViewController : UIViewController

@property(nonatomic,strong) Events *event;

@end
