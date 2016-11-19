//
//  ViewController.m
//  UploadDownload
//
//  Created by tonyguan on 2016/10/21.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property(nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)startToMove:(id)sender {
    if ([self.activityIndicatorView isAnimating]) {
        [self.activityIndicatorView stopAnimating];
    }else{
        [self.activityIndicatorView startAnimating];
    }
}

- (IBAction)downloadProgress:(id)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(download)
                                                userInfo:nil
                                                 repeats:YES];
}

-(void)download{
    self.progressView.progress = self.progressView.progress+0.1;
    if (self.progressView.progress == 1.0) {
        [self.timer invalidate];
        
        UIAlertController* alertController  = [UIAlertController alertControllerWithTitle:@"download completed！" message: @"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:okAction];
        
        //显示
        [self presentViewController:alertController animated:true completion:nil];
    }
    
}

@end
