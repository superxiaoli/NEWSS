//
//  HeadDetailViewController.m
//  News
//
//  Created by Xcord-LS on 15/10/16.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "HeadDetailViewController.h"

@interface HeadDetailViewController ()
@property (nonatomic,strong)UIWebView *webView;

@end

@implementation HeadDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    // webview 处理
    self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    [self.webView setScalesPageToFit:YES];// 设置内容自适应屏幕
    
    [self.view addSubview:_webView];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.webStr]];
    [self.webView loadRequest:request];
    
    
    // 设置左bar点击事件
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
    
    
}
-(void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
