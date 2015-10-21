//
//  PeHead1ViewController.m
//  News
//
//  Created by Xcord-LS on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "PeHead1ViewController.h"
#import "Pe5Model.h"

@interface PeHead1ViewController ()
@property (nonatomic,strong)NSMutableArray *PeHead1Arr;
@property (nonatomic,strong)UIScrollView *PeHead2ScroView;
@end

@implementation PeHead1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setPePicData];
    
    
}

-(void)setPePicData
{
    NSURL *url = [NSURL URLWithString:self.peHead1Str];
    NSLog(@"%@",self.PeHead1Arr);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    self.PeHead1Arr = [NSMutableArray array];
    for (NSDictionary *dic  in [dictionary objectForKey:@"photos"])
    {
        Pe5Model *pe5 = [[Pe5Model alloc]init];
        
        [pe5 setValuesForKeysWithDictionary:dic];
        [self.PeHead1Arr addObject:pe5];
        
    }
    
    
    
    
    self.PeHead2ScroView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, 375, 600)];
    self.PeHead2ScroView.backgroundColor = [UIColor blackColor];
    self.PeHead2ScroView.contentSize = CGSizeMake(CGRectGetWidth(self.PeHead2ScroView.frame) * self.PeHead1Arr.count, 0);
    self.PeHead2ScroView.pagingEnabled = YES;
    
    [self.view addSubview:self.PeHead2ScroView];
    
    for (int i = 0; i < self.PeHead1Arr.count; i++)
    {
        Pe5Model *p = self.PeHead1Arr[i];
        CGFloat ImageX = CGRectGetWidth(self.PeHead2ScroView.frame) *i;
        UIImageView *picView = [[UIImageView alloc]initWithFrame:CGRectMake(ImageX , 20, 375, 400)];
        
        picView.backgroundColor = [UIColor blackColor];
        [picView sd_setImageWithURL:[NSURL URLWithString:p.imgurl]];
        picView.contentMode = UIViewContentModeScaleAspectFit;
        [self.PeHead2ScroView addSubview:picView];
        
        UITextView *picView1 = [[UITextView alloc]initWithFrame:CGRectMake(ImageX +10, 350, 355, 190)];
        if (i == 0)
        {
            picView1.text = p.note;
        }
        else
        {
            picView1.text = p.imgtitle;
        }
        
        picView1.backgroundColor = [UIColor clearColor];
        picView1.font = [UIFont systemFontOfSize:17];
        picView1.textColor = [UIColor whiteColor];
        // 自适应高度
        picView1.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        //是否可以拖动
        picView1.scrollEnabled = YES;
        // 设置不弹出键盘
        [picView1 setEditable:NO];
        [self.PeHead2ScroView addSubview:picView1];
        
        
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
