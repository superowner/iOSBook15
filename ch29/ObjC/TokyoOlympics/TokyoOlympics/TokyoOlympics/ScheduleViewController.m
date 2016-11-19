//
//  ScheduleViewController.m
//  TokyoOlympics
//
//  Created by tonyguan on 2016/11/17.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ScheduleViewController.h"
#import "EventsDetailViewController.h"

#import <PersistenceLayer/Schedule.h>
#import <BusinessLogicLayer/ScheduleBL.h>


@interface ScheduleViewController ()
//表视图使用的数据
@property (strong, nonatomic) NSDictionary * data;
//比赛日期列表
@property (strong, nonatomic) NSArray * arrayGameDateList;
@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.data == nil || [self.data count] == 0) {
        ScheduleBL *bl = [[ScheduleBL alloc] init];
        self.data = [bl readData];
        NSArray* keys = [self.data allKeys];
        //对key进行排序
        self.arrayGameDateList = [keys sortedArrayUsingSelector:@selector(compare:)];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 表视图数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSArray* keys = [self.data allKeys];
    return [keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //比赛日期
    NSString* strGameDate = self.arrayGameDateList[section];
    //比赛日期下的比赛日程表
    NSArray *schedules = self.data[strGameDate];
    return [schedules count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //比赛日期
    NSString* strGameDate = self.arrayGameDateList[section];
    return strGameDate;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    //比赛日期
    NSString* strGameDate = self.arrayGameDateList[indexPath.section];
    //比赛日期下的比赛日程表
    NSArray *schedules = self.data[strGameDate];
    
    Schedule *schedule = schedules[indexPath.row];
    NSString* subtitle = [[NSString alloc] initWithFormat:@"%@ | %@", schedule.GameInfo, schedule.Event.EventName];
    
    cell.textLabel.text = schedule.GameTime;
    cell.detailTextLabel.text = subtitle;
    
    return cell;
}

-(NSArray *) sectionIndexTitlesForTableView: (UITableView *) tableView {
    NSMutableArray *listTitles = [[NSMutableArray alloc] init];
    // 2020-08-09 -> 08-09
    for (NSString *item in self.arrayGameDateList) {
        NSString *title = [item substringFromIndex:5];
        [listTitles addObject:title];
    }
    return listTitles;
}


@end
