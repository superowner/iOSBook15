//
//  ViewController.m
//  MoveCell
//
//  Created by tonyguan on 2016/10/25.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *listTeams;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    self.navigationItem.rightBarButtonItem =  self.editButtonItem;
    self.navigationItem.title = @"单元格移动";
    self.listTeams = [NSMutableArray arrayWithArray:@[@"黑龙江", @"吉林", @"辽宁"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UIViewController生命周期方法，用于响应视图编辑状态变化
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:TRUE];
}

#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.listTeams[indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath*)indexPath {
    return TRUE;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath*)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *stringToMove = self.listTeams[sourceIndexPath.row];
    [self.listTeams removeObjectAtIndex:sourceIndexPath.row];
    [self.listTeams insertObject:stringToMove atIndex:destinationIndexPath.row];
}


#pragma mark --UITableViewDelegate 协议方法
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  UITableViewCellEditingStyleNone;
}

@end
