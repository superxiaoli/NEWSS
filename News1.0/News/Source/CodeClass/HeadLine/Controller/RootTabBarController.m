//
//  RootTabBarController.m
//  News
//
//  Created by Xcord-LS on 15/10/15.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "RootTabBarController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    NewsViewController *NewsController =[[NewsViewController alloc]init];
    UINavigationController *NewVC = [[UINavigationController alloc]initWithRootViewController:NewsController];
    
    NewVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"资讯" image:nil selectedImage:nil];
    //NewsController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"资讯" image:nil selectedImage:nil];

    
    
    
    
//    MyTableViewController *MyController = [[MyTableViewController alloc]init];
//    UINavigationController *MyVC = [[UINavigationController alloc]initWithRootViewController:MyController];
//    MyVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:nil selectedImage:nil];
    //MyController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:nil selectedImage:nil];
    
    
    self.viewControllers = @[NewVC];
    //self.viewControllers = @[NewsController,MyController];
    
   

     
    
    
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
