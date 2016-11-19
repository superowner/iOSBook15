//
//  ViewController.m
//  DatePickerSample
//
//  Created by tonyguan on 2016/10/21.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onclick:(id)sender {
    
    NSDate * theDate = self.datePicker.date;
    NSLog(@"the date picked is: %@", [theDate descriptionWithLocale:[NSLocale currentLocale]]);
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init] ;
    dateFormatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSLog(@"the date formate is: %@", [dateFormatter stringFromDate:theDate]);
    self.label.text = [dateFormatter stringFromDate:theDate];
    
}

@end
