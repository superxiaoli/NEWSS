//
//  QGViewController.m
//  News
//
//  Created by zhaoliangyu on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "QGViewController.h"

@interface QGViewController ()
@property(nonatomic,strong)QGWebView * qgWebView;
@end

@implementation QGViewController
-(void)loadView
{
    self.qgWebView = [[QGWebView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = _qgWebView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setupView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"<返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];
    // Do any additional setup after loading the view.
}
-(void)p_setupView
{
    NSURL * url = [NSURL URLWithString:self.urlStr];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    self.qgWebView.scalesPageToFit = YES;
    
    [self.qgWebView loadRequest:request];
}
-(void)leftButtonAction:(UIBarButtonItem *)sender
{
    if ([self.qgWebView canGoBack]) {
        [self.qgWebView goBack];
    }else
    {
        [self.navigationController  popToRootViewControllerAnimated:YES];
    }
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
