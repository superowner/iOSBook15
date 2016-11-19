//
//  ViewController.m
//  NavigationComb
//
//  Created by tonyguan on 2016/10/31.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *listData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"provinces_cities" ofType:@"plist"];
    
    self.dictData = [[NSDictionary  alloc] initWithContentsOfFile:plistPath];
    
    UINavigationController *navigationController = (UINavigationController*)self.parentViewController;
    NSString *selectProvinces = navigationController.tabBarItem.title;
    
    NSLog(@"%@", selectProvinces);
    
    if ([selectProvinces isEqualToString:@"黑龙江"]) {
        self.listData = self.dictData[@"黑龙江省"];
        self.navigationItem.title = @"黑龙江省信息";
    } else if ([selectProvinces isEqualToString:@"吉林"]) {
        self.listData = self.dictData[@"吉林省"];
        self.navigationItem.title = @"吉林省信息";
    } else {
        self.listData = self.dictData[@"辽宁省"];
        self.navigationItem.title = @"辽宁省信息";
    }
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
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark --选择表视图行时候触发
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"ShowDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger selectedIndex = indexPath.row;
        
        NSDictionary *dict = self.listData[selectedIndex];
        
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.url = dict[@"url"];
        detailViewController.title = dict[@"name"];
    }
}


@end
