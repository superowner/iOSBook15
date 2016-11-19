//
//  CitiesViewController.m
//  TreeNavigation
//
//  Created by tonyguan on 2016/10/31.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "CitiesViewController.h"
#import "DetailViewController.h"

@interface CitiesViewController ()

@end

@implementation CitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --实现表视图数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSInteger row = [indexPath row];
    NSDictionary *dict = self.listData[row];
    
    cell.textLabel.text = dict[@"name"];
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

#pragma mark --实现表视图委托协议方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger selectedIndex = [indexPath row];
    NSDictionary *dict = self.listData[selectedIndex];
    
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.url = dict[@"url"];
    detailViewController.title = dict[@"name"];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
