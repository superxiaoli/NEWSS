//
//  HeadPicshowController.m
//  News
//
//  Created by Xcord-LS on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "HeadPicshowController.h"
#import "PIcShowView.h"
#import "HeadLinePicModel.h"

@interface HeadPicshowController ()<UIScrollViewDelegate>
@property (nonatomic,strong)NSMutableArray *picArr;
@property (nonatomic,strong)UIScrollView *picScroView;

@end

@implementation HeadPicshowController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    [self setPicData];
}

-(void)setPicData
{
    NSURL *url = [NSURL URLWithString:self.picStr];
    NSLog(@"%@",self.picStr);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    self.picArr = [NSMutableArray array];
    for (NSDictionary *dic  in [dictionary objectForKey:@"photos"])
    {
        HeadLinePicModel *hlm = [[HeadLinePicModel alloc]init];
        
        [hlm setValuesForKeysWithDictionary:dic];
        [self.picArr addObject:hlm];
        //NSLog(@"%@",self.picArr);
    }
    
    //NSLog(@"%@",self.picArr);
    
   
    self.picScroView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, 375, 600)];
    self.picScroView.backgroundColor = [UIColor blackColor];
    self.picScroView.contentSize = CGSizeMake(CGRectGetWidth(self.picScroView.frame) * self.picArr.count, 0);
    self.picScroView.pagingEnabled = YES;
    self.picScroView.delegate =self;
    [self.view addSubview:self.picScroView];
    
    for (int i = 0; i < self.picArr.count; i++)
    {
        HeadLinePicModel *h = self.picArr[i];
        CGFloat ImageX = CGRectGetWidth(self.picScroView.frame) *i;
        UIImageView *picView = [[UIImageView alloc]initWithFrame:CGRectMake(ImageX , 20, 375, 400)];
        
        picView.backgroundColor = [UIColor blackColor];
        [picView sd_setImageWithURL:[NSURL URLWithString:h.imgurl]];
        // 自适应图片
        picView.contentMode = UIViewContentModeScaleAspectFit;
        [self.picScroView addSubview:picView];
        
        UITextView *picView1 = [[UITextView alloc]initWithFrame:CGRectMake(ImageX +10, 350, 355, 190)];
    
        picView1.text = h.note;
        picView1.backgroundColor = [UIColor clearColor];
        picView1.font = [UIFont systemFontOfSize:17];
        picView1.textColor = [UIColor whiteColor];
        // 自适应高度
        picView1.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        //是否可以拖动
        picView1.scrollEnabled = YES;
        // 设置不弹出键盘
        [picView1 setEditable:NO];
        [self.picScroView addSubview:picView1];
  
        
    }
 
}




- (void)didReceiveMemoryWarning
{
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
