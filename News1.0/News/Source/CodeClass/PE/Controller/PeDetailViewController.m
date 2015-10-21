//
//  PeDetailViewController.m
//  News
//
//  Created by Xcord-LS on 15/10/19.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "PeDetailViewController.h"

@interface PeDetailViewController ()
@property (nonatomic,strong)UIWebView *webView1;
@end

@implementation PeDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webView1 = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    [self.webView1 setScalesPageToFit:YES];// 设置内容自适应屏幕
    
    [self.view addSubview:_webView1];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.detailWebUrl]];
    [self.webView1 loadRequest:request];
    
    
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
