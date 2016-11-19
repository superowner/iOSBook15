//
//  ViewController.m
//  RefreshControlSample
//
//  Created by tonyguan on 2016/10/25.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray* Logs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化变量和时间
    self.Logs = [[NSMutableArray alloc] init];
    NSDate *date = [[NSDate alloc] init];
    [self.Logs addObject:date];
    
    //初始化UIRefreshControl
    UIRefreshControl *rc = [[UIRefreshControl alloc] init];
    rc.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [rc addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = rc;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) refreshTableView {
    if (self.refreshControl.refreshing) {
        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"加载中..."];
        //添加新的模拟数据
        NSDate *date = [[NSDate alloc] init];
        [self.Logs addObject:date];
        
        [self.refreshControl endRefreshing];
        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
        
        [self.tableView reloadData];
    }
}

#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.Logs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat: @"yyyy-MM-dd HH:mm:ss zzz"];
    
    cell.textLabel.text = [dateFormat stringFromDate: self.Logs[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


@end
