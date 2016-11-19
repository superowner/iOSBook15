//
//  ViewController.m
//  TreeNavigation
//
//  Created by tonyguan on 2016/10/30.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"
#import "CitiesViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *listData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"provinces_cities" ofType:@"plist"];
    
    self.dictData = [[NSDictionary  alloc] initWithContentsOfFile:plistPath];
    self.listData = [self.dictData allKeys];
    self.title = @"省份信息";
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
    cell.textLabel.text = self.listData[row];
    
    return cell;
}

#pragma mark --场景过渡之前的预处理
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"ShowSelectedProvince"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger selectedIndex = indexPath.row;
        
        CitiesViewController *citiesViewController = segue.destinationViewController;
        NSString *selectName = self.listData[selectedIndex];
        citiesViewController.listData = self.dictData[selectName];
        citiesViewController.title = selectName;
        
    }
}


@end
