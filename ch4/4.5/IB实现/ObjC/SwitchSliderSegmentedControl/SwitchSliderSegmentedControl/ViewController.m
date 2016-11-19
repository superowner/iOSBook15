//
//  ViewController.m
//  SwitchSliderSegmentedControl
//
//  Created by tonyguan on 2016/10/20.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UILabel *sliderValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//使两个开关的值保持一致
- (IBAction)switchValueChanged:(id)sender {
    UISwitch *witchSwitch = (UISwitch *)sender;
    BOOL setting = witchSwitch.isOn;
    [self.leftSwitch setOn:setting animated:TRUE];
    [self.rightSwitch setOn:setting animated:TRUE];
}

//点击分段控件控制开关控件的隐藏或显示
- (IBAction)touchDown:(id)sender {
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSLog(@"选择的段 : %li", segmentedControl.selectedSegmentIndex);
    
    if (self.leftSwitch.hidden) {
        self.rightSwitch.hidden = FALSE;
        self.leftSwitch.hidden  = FALSE;
    }else{
        self.leftSwitch.hidden  = TRUE;
        self.rightSwitch.hidden = TRUE;
    }
}

//用标签显示滑块的值
- (IBAction)sliderValueChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value);
    NSString *newText = [[NSString alloc]initWithFormat:@"%i",progressAsInt];
    NSLog(@"滑块的值 : %@", newText);
    self.sliderValue.text = newText;
}

@end
