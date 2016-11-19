//
//  MasterViewController.m
//  SplitViewSample
//
//  Created by tonyguan on 2016/11/1.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.objects = @[@"Blue View", @"Yellow View"];
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

#pragma mark --表视图委托协议
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *controller = [[DetailViewController alloc] init];
    controller.selectRow = indexPath.row;
    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    controller.navigationItem.leftItemsSupplementBackButton = YES;
    UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self showDetailViewController:detailNavigationController sender:self];
    
}

@end
