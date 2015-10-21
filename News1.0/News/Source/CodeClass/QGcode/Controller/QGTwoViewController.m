//
//  QGTwoViewController.m
//  News
//
//  Created by zhaoliangyu on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "QGTwoViewController.h"

@interface QGTwoViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)QGTwoView * qgTwoView;
@property(nonatomic,strong)NSArray * dataArr;
@end

@implementation QGTwoViewController
-(void)loadView
{
    self.qgTwoView  = [[QGTwoView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _qgTwoView;
}
- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [super viewDidLoad];

    [self p_getData];
    
    self.qgTwoView.scrollView.delegate = self;
    
    self.edgesForExtendedLayout = false;
//    [self.view addSubview:_qgTwoView];
    
//    self.qgTwoView.scrollView.scrollEnabled = YES;
    
    
}

-(void)p_getData
{
    [[QGTwoData shareGetData]getDataWithURL:self.urlStr PassValue:^(NSArray *array) {
        
        self.dataArr = [NSArray arrayWithArray:array];
        
        self.qgTwoView.scrollView.contentSize = CGSizeMake((self.view.frame.size.width - 10) * self.dataArr.count, 200);
        
        self.qgTwoView.scrollView.pagingEnabled = YES;
        
        NSLog(@")))))))))))%ld",array.count);
        
        for (int i = 0; i < self.dataArr.count; i++) {
            UIImageView * imgeView = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-10)*i, 0, self.view.frame.size.width-10, 300)];
            
            imgeView.contentMode = UIViewContentModeScaleAspectFit;
            
            
            NSDictionary * dict = self.dataArr[i];
            [imgeView sd_setImageWithURL:[NSURL URLWithString:[dict objectForKey:@"imgurl"]]];
            
//            self.qgTwoView.scrollView.backgroundColor = [UIColor blackColor];
           
            self.qgTwoView.textView.backgroundColor = [UIColor clearColor];
            
            self.qgTwoView.textView.textColor = [UIColor whiteColor];
            self.qgTwoView.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight ;
            self.qgTwoView.textView.scrollEnabled = YES;
            self.qgTwoView.textView.font = [UIFont fontWithName:@"Arial" size:15];
            // 点击不弹出键盘
            [self.qgTwoView.textView setEditable:NO];
            self.qgTwoView.scrollView.showsHorizontalScrollIndicator = NO;
            [self.qgTwoView.scrollView addSubview:imgeView];
            
        }

        
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger integer = scrollView.contentOffset.x/(self.view.frame.size.width-10);
    
    NSDictionary * dict = self.dataArr[integer];
    if ([dict objectForKey:@"note"]!=nil) {
        self.qgTwoView.textView.text = [dict objectForKey:@"note"];
    }else if([dict objectForKey:@"imgtitle"]!=nil)
    {
        self.qgTwoView.textView.text = [dict objectForKey:@"imgtitle"];
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
