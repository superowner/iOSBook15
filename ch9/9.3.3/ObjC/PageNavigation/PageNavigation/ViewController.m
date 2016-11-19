//
//  ViewController.m
//  PageNavigation
//
//  Created by tonyguan on 2016/10/30.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "ViewController.h"

//翻页的方向
enum DirectionForward
{
    ForwardBefore = 1 //向前
    ,ForwardAfter =2  //向后
};

@interface ViewController () <UIPageViewControllerDataSource,UIPageViewControllerDelegate> {
    //当前Page的索引
    int pageIndex;
    //翻页的方向变量
    int directionForward;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *viewControllers;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //当前Page的索引
    pageIndex = 0;
    //翻页的方向变量
    directionForward = ForwardAfter;
    
    UIViewController *page1ViewController = [[UIViewController alloc] init];
    UIViewController *page2ViewController = [[UIViewController alloc] init];
    UIViewController *page3ViewController = [[UIViewController alloc] init];
    
    self.viewControllers = @[page1ViewController, page2ViewController, page3ViewController];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView1.image = [UIImage imageNamed:@"达芬奇-蒙娜丽莎.png"];
    [page1ViewController.view addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView2.image = [UIImage imageNamed:@"罗丹-思想者.png"];
    [page2ViewController.view addSubview:imageView2];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView3.image = [UIImage imageNamed:@"保罗克利-肖像.png"];
    [page3ViewController.view addSubview:imageView3];
    
    //设置UIPageViewController控制器
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    //设置首页
    [self.pageViewController setViewControllers:@[page1ViewController]
                                      direction:UIPageViewControllerNavigationDirectionForward animated:TRUE completion:nil];
    
    [self.view addSubview:self.pageViewController.view];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --实现UIPageViewControllerDataSource协议
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    pageIndex--;
    
    if (pageIndex < 0){
        pageIndex = 0;
        return nil;
    }
    
    directionForward = ForwardBefore;
    return self.viewControllers[pageIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    pageIndex++;
    
    if (pageIndex > 2){
        pageIndex = 2;
        return nil;
    }
    
    directionForward = ForwardAfter;
    return self.viewControllers[pageIndex];
}


#pragma mark --实现UIPageViewControllerDelegate协议
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
    self.pageViewController.doubleSided = FALSE;
    return UIPageViewControllerSpineLocationMin;
}


- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (!completed) {
        if (directionForward == ForwardAfter) {
            pageIndex--;
        }
        if (directionForward == ForwardBefore) {
            pageIndex++;
        }
    }
}


@end
