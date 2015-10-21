//
//  PEPicViewController.m
//  News
//
//  Created by Xcord-LS on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "PEPicViewController.h"
#import "Pe4Model.h"

@interface PEPicViewController ()
@property (nonatomic,strong)NSMutableArray *PepicArr;
@property (nonatomic,strong)UIScrollView *PePicScroView;

@end

@implementation PEPicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self setPePicData];
    
    
}

-(void)setPePicData
{
    NSURL *url = [NSURL URLWithString:self.PePicStr];
    NSLog(@"%@",self.PePicStr);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    self.PepicArr = [NSMutableArray array];
    for (NSDictionary *dic  in [dictionary objectForKey:@"photos"])
    {
       Pe4Model *pe4 = [[Pe4Model alloc]init];
        
        [pe4 setValuesForKeysWithDictionary:dic];
        [self.PepicArr addObject:pe4];
        NSLog(@"%@",self.PepicArr);
    }
    
    
    
    
    self.PePicScroView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, 375, 600)];
    self.PePicScroView.backgroundColor = [UIColor blackColor];
    self.PePicScroView.contentSize = CGSizeMake(CGRectGetWidth(self.PePicScroView.frame) * self.PepicArr.count, 0);
    self.PePicScroView.pagingEnabled = YES;

    [self.view addSubview:self.PePicScroView];
    
    for (int i = 0; i < self.PepicArr.count; i++)
    {
        Pe4Model *p = self.PepicArr[i];
        CGFloat ImageX = CGRectGetWidth(self.PePicScroView.frame) *i;
        UIImageView *picView = [[UIImageView alloc]initWithFrame:CGRectMake(ImageX , 20, 375, 400)];
        
        picView.backgroundColor = [UIColor blackColor];
        [picView sd_setImageWithURL:[NSURL URLWithString:p.imgurl]];
        picView.contentMode = UIViewContentModeScaleAspectFit;
        [self.PePicScroView addSubview:picView];
        
        UITextView *picView1 = [[UITextView alloc]initWithFrame:CGRectMake(ImageX +10, 350, 355, 190)];
        picView1.text = p.note;

       
        picView1.backgroundColor = [UIColor clearColor];
        picView1.font = [UIFont systemFontOfSize:17];
        picView1.textColor = [UIColor whiteColor];
        // 自适应高度
        picView1.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        //是否可以拖动
        picView1.scrollEnabled = YES;
        // 设置不弹出键盘
        [picView1 setEditable:NO];
        [self.PePicScroView addSubview:picView1];
        
        
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
