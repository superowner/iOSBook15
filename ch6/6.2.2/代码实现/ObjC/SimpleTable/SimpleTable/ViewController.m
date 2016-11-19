//
//  ViewController.m
//  SimpleTable
//
//  Created by tonyguan on 2016/10/23.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

#define CellIdentifier @"CellIdentifier"

@interface ViewController ()

@property (nonatomic, strong) NSArray *listTeams;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"team"
                                           ofType:@"plist"];
    //获取属性列表文件中的全部数据
    self.listTeams = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    //设置表视图委托对象为self
    self.tableView.delegate = self;
    //设置表视图数据对象为self
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    NSDictionary *rowDict = self.listTeams[row];
    cell.textLabel.text = rowDict[@"name"];
    
    NSString *imagePath = [[NSString alloc] initWithFormat: @"%@.png", rowDict[@"image"]];
    cell.imageView.image = [UIImage imageNamed:imagePath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end

