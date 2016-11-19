//
//  SelectViewController.m
//  PopoverViewSample
//
//  Created by tonyguan on 2016/11/2.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()

@property (nonatomic,strong) NSArray *listData;
@property (nonatomic, strong) NSIndexPath* lastIndexPath;

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listData = @[@"红色", @"蓝色", @"黄色"];
    self.preferredContentSize = CGSizeMake(200, 140);
    self.tableView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.listData[indexPath.row];
    
    return cell;
}

#pragma mark --UITableViewDelegate 协议方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger newRow = indexPath.row;
    
    NSInteger oldRow = (self.lastIndexPath != nil) ? [self.lastIndexPath row] : -1;
    
    if (newRow != oldRow) {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        if (self.lastIndexPath) {
            UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:self.lastIndexPath];
            oldCell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        self.lastIndexPath = indexPath;
    }
    
}


@end
