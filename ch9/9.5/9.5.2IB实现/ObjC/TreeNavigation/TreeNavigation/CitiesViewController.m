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
    
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    NSDictionary *dict = self.listData[row];
    
    cell.textLabel.text = dict[@"name"];
    
    return cell;
}

#pragma mark --选择表视图行时候触发
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"ShowSelectedCity"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger selectedIndex = indexPath.row;
        
        NSDictionary *dict = self.listData[selectedIndex];
        
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.url = dict[@"url"];
        detailViewController.title = dict[@"name"];
    }
    
}

@end
