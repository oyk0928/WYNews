//
//  MainTabBarController.m
//  WYNews
//
//  Created by 姚乐 on 16/10/21.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "MainTabBarController.h"
#import "YAOTabBar.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YAOTabBar* tabbar = [[YAOTabBar alloc]init];
    tabbar.frame = self.tabBar.frame;
    tabbar.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    [self.view addSubview:tabbar];
    [self.tabBar removeFromSuperview];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
