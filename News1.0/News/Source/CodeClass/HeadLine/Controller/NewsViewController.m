//
//  NewsViewController.m
//  News
//
//  Created by Xcord-LS on 15/10/15.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "NewsViewController.h"
#import "HeadLineTableViewController.h"
#import "PETableViewController.h"
#import "LGtitleBarView.h"



@interface NewsViewController ()<UIScrollViewDelegate,LGtitleBarViewDelegate>



@property(nonatomic,strong)UIScrollView *BackView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) LGtitleBarView *titleBar;


@property (nonatomic,strong)HeadLineTableViewController *head ;
@property (nonatomic,strong)PETableViewController *pe;


@end

@implementation NewsViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.titleBar = [[LGtitleBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    //self.titleBar.backgroundColor = [UIColor blackColor];
    self.titles = @[@"今日头条", @"体育", @"科技", @"财经", @"娱乐", @"八卦", @"娱乐", @"八卦"];
    
    self.titleBar.titles = _titles;
    self.titleBar.delegate = self;
    [self.view addSubview:_titleBar];
    

    [self interfaceHandle];
    
    
}
-(void)interfaceHandle
{
    self.BackView = [[UIScrollView alloc]init];
    self.BackView.frame = CGRectMake(0, 44, kScreenWidth, kScreenHight);
    self.BackView.contentSize = CGSizeMake(kScreenWidth *5, kScreenHight);
    self.BackView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_BackView];
    
    
    
    self.head = [[HeadLineTableViewController alloc]init];
    self.head.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:_head];
    [self.BackView addSubview:_head.tableView];
    
    self.pe = [[PETableViewController alloc]init];
    self.pe.view.frame = CGRectMake(CGRectGetMaxX(self.view.frame), 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:_pe];
    [self.BackView addSubview:_pe.tableView];
}

-(void)LGtitleBarView:(LGtitleBarView *)titleBarView didSelectedItem:(int)index
{
    

    CGFloat x = index * self.BackView.bounds.size.width;
    [self.BackView setContentOffset:CGPointMake(x, 0) animated:YES];

}




-(void)segmentAction:(UISegmentedControl *)sender
{
    
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
