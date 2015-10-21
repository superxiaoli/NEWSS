//
//  HeadLinePicViewController.m
//  News
//
//  Created by Xcord-LS on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "HeadLinePicViewController.h"
#import "HeadLinePicModel.h"

@interface HeadLinePicViewController ()
@property (nonatomic,strong)NSMutableArray *HeadpicArr;
@property (nonatomic,strong)UIScrollView *HeadPicScroView;
@end

@implementation HeadLinePicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPePicData];
    
    
}

-(void)setPePicData
{
    NSURL *url = [NSURL URLWithString:self.HeadPicStr];
    NSLog(@"%@",self.HeadpicArr);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    self.HeadpicArr = [NSMutableArray array];
    for (NSDictionary *dic  in [dictionary objectForKey:@"photos"])
    {
        HeadLinePicModel *HeadTop = [[HeadLinePicModel alloc]init];
        
        [HeadTop setValuesForKeysWithDictionary:dic];
        [self.HeadpicArr addObject:HeadTop];
        
    }
    
    
    
    
    self.HeadPicScroView= [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, 375, 600)];
    self.HeadPicScroView.backgroundColor = [UIColor blackColor];
    self.HeadPicScroView.contentSize = CGSizeMake(CGRectGetWidth(self.HeadPicScroView.frame) * self.HeadpicArr.count, 0);
    self.HeadPicScroView.pagingEnabled = YES;
    
    [self.view addSubview:self.HeadPicScroView];
    
    for (int i = 0; i < self.HeadpicArr.count; i++)
    {
        HeadLinePicModel *p = self.HeadpicArr[i];
        CGFloat ImageX = CGRectGetWidth(self.HeadPicScroView.frame) *i;
        UIImageView *picView = [[UIImageView alloc]initWithFrame:CGRectMake(ImageX , 20, 375, 400)];
        
        picView.backgroundColor = [UIColor blackColor];
        [picView sd_setImageWithURL:[NSURL URLWithString:p.imgurl]];
        picView.contentMode = UIViewContentModeScaleAspectFit;
        [self.HeadPicScroView addSubview:picView];
        
        UITextView *picView1 = [[UITextView alloc]initWithFrame:CGRectMake(ImageX +10, 350, 355, 190)];
                //if (i == 0)
                //{
                    picView1.text = p.note;
                //}
//                else
//                {
//        picView1.text = p.imgtitle;
//        //}
        
        picView1.backgroundColor = [UIColor clearColor];
        picView1.font = [UIFont systemFontOfSize:17];
        picView1.textColor = [UIColor whiteColor];
        // 自适应高度
        picView1.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        //是否可以拖动
        picView1.scrollEnabled = YES;
        // 设置不弹出键盘
        [picView1 setEditable:NO];
        [self.HeadPicScroView addSubview:picView1];
        
        
    }
    
}


@end
