//
//  ViewController.m
//  CustomCell
//
//  Created by tonyguan on 2016/10/24.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

#define cellIdentifier  @"CellIdentifier"

@interface ViewController ()

@property (nonatomic, strong) NSArray *listTeams;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"team" ofType:@"plist"];
    //获取属性列表文件中的全部数据
    self.listTeams = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    //设置可重用单元格标识与单元格类型
    [self.tableView registerClass:[CustomCell class]  forCellReuseIdentifier:cellIdentifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSUInteger row = [indexPath row];
    
    NSDictionary *rowDict = self.listTeams[row];
    cell.myLabel.text = rowDict[@"name"];
    
    NSString *imageFile = rowDict[@"image"];
    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.png", imageFile];
    
    cell.myImageView.image = [UIImage imageNamed:imagePath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
