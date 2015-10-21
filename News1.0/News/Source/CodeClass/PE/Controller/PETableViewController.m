//
//  PETableViewController.m
//  News
//
//  Created by Xcord-LS on 15/10/19.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "PETableViewController.h"
#import "Pe1TableViewCell.h"
#import "Pe2TableViewCell.h"
#import "GetPeData.h"
#import "Pe2Model.h"
#import "PeDetailViewController.h"
#import "PEPicViewController.h"
#import "Pe1View.h"
#import "PeHead1ViewController.h"
@interface PETableViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)NSArray *arr1;
@property (nonatomic,strong)NSArray *arr2;
@property (nonatomic,strong)NSArray *arr3;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)UIView *view1;
@property (nonatomic,strong)UILabel *lable;
@property (nonatomic,strong)Pe1View *pV;


@end

@implementation PETableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.tableView registerClass:[Pe1TableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.tableView  registerClass:[Pe2TableViewCell class] forCellReuseIdentifier:@"cell2"];
    
   
    
    self.arr1 = [NSArray array];
    self.arr2 = [NSArray array];
    self.arr3 = [NSArray array];
    [[GetPeData sharePeHandleData] getDataWithUrl:KPeURL PeValue:^(NSArray *arr1, NSArray *arr2,NSArray *arr3) {
        
        self.arr1 = arr1;
        self.arr2 = arr2;
        self.arr3 = arr3;
        [self.tableView reloadData];
    }];
    
    
    self.pV = [[Pe1View alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.frame),210)];
    
    [self setUpScrPage];
     self.pV.PeScrollView.delegate = self;
}


-(void)setUpScrPage
{

    Pe2Model *Pm = self.arr2[0];
    [self.pV.image1 sd_setImageWithURL:[NSURL URLWithString:Pm.imgsrc]];
    PeModel *Pm2 = self.arr1[0];
    [self.pV.image2 sd_setImageWithURL:[NSURL URLWithString:Pm2.imgsrc]];
    
    // 图片点击事件
    UITapGestureRecognizer *PeTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(image1Action)];
    [self.pV.image1 addGestureRecognizer:PeTap1];
    self.pV.image1.userInteractionEnabled = YES;// 打开图片交互
    
    // 图片点击事件
    UITapGestureRecognizer *PeTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(image2Action)];
    [self.pV.image2 addGestureRecognizer:PeTap2];
    self.pV.image2.userInteractionEnabled = YES;
    
    
    [self.pV.PePageController addTarget:self action:@selector(HeadPageAction:) forControlEvents:UIControlEventTouchUpInside];
    [self setupTimer];
    
    // 设置初始值
    Pe2Model *Pm1 = self.arr2[0];
    self.pV.PeLabel.text = Pm1.title;
    self.pV.PeLabel.font = [UIFont systemFontOfSize:14];
    self.pV.PeLabel.backgroundColor = [UIColor orangeColor];
    self.tableView.tableHeaderView = self.pV;
    
}
-(void)image1Action
{
    Pe2Model *pmHead1 = self.arr2[0];
    NSString *s1 = pmHead1.url;
    NSString *s2 = [s1 substringFromIndex:4];
    NSString *s4 = [s2 stringByReplacingOccurrencesOfString :@"|" withString:@"/"];
    NSString *s3 = [[NSString alloc]initWithString:[NSString stringWithFormat:@"http://c.3g.163.com/photo/api/set/%@.json",s4]];
 
    
    PeHead1ViewController *pe1Head = [[PeHead1ViewController alloc]init];
    
    pe1Head.peHead1Str = s3;
    NSLog(@"%@",s3);
    [self.navigationController pushViewController:pe1Head animated:YES];
}

-(void)image2Action
{
    PeModel *pmHead2 = self.arr1[0];
    NSString *s1 = pmHead2.photosetID;
    NSString *s2 = [s1 substringFromIndex:4];
    NSString *s4 = [s2 stringByReplacingOccurrencesOfString :@"|" withString:@"/"];
    NSString *s3 = [[NSString alloc]initWithString:[NSString stringWithFormat:@"http://c.3g.163.com/photo/api/set/%@.json",s4]];
    
    
    PeHead1ViewController *pe1Head = [[PeHead1ViewController alloc]init];
    
    pe1Head.peHead1Str = s3;
    NSLog(@"%@",s3);
    [self.navigationController pushViewController:pe1Head animated:YES];
}


-(void)setupTimer
{
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)timerChange
{
    int page = (self.pV.PePageController.currentPage + 1) % 2;
    self.pV.PePageController.currentPage = page;
    [self HeadPageAction:self.pV.PePageController];
}
// 设置page点击事件
-(void)HeadPageAction:(UIPageControl *)sender
{
    CGFloat x = (sender.currentPage) * self.pV.PeScrollView.bounds.size.width;
    [self.pV.PeScrollView setContentOffset:CGPointMake(x, 0) animated:YES];

    if (x == 0)
    {
        Pe2Model *Pm = self.arr2[0];
        self.pV.PeLabel.text = Pm.title;
        self.pV.PeLabel.font = [UIFont systemFontOfSize:14];
        self.pV.PeLabel.backgroundColor = [UIColor orangeColor];
        
    }
    if (x == self.pV.PeScrollView.bounds.size.width)
    {
        PeModel *Pm2 = self.arr1[0];
        self.pV.PeLabel.text = Pm2.title;
        self.pV.PeLabel.font = [UIFont systemFontOfSize:14];
        self.pV.PeLabel.backgroundColor = [UIColor orangeColor];
        
    }


}
// 移动scrollview时候,让定时器停止********************
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
    
}
// 停止移动scrollview时候,让定时器开始
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self setupTimer];
}

//活动scrollView时page动的方法(scroll减速时触发的方法)  /// 有问题
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pV.PePageController.currentPage = self.pV.PeScrollView.contentOffset.x / self.view.bounds.size.width;
   
    CGFloat x = self.pV.PePageController.currentPage;
 
    
    if (x == 0)
    {
        Pe2Model *Pm = self.arr2[0];
        self.pV.PeLabel.text = Pm.title;
        self.pV.PeLabel.font = [UIFont systemFontOfSize:14];
        self.pV.PeLabel.backgroundColor = [UIColor orangeColor];
        
    }
    if (x == 1)
    {
        PeModel *Pm2 = self.arr1[0];
        self.pV.PeLabel.text = Pm2.title;
        self.pV.PeLabel.font = [UIFont systemFontOfSize:14];
        self.pV.PeLabel.backgroundColor = [UIColor orangeColor];
        
    }

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.arr1.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PeModel *p = self.arr1[indexPath.row];
    
    if ([p.digest isEqualToString:@""])
    {
        Pe2TableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        
        PeModel *hImage = self.arr1[indexPath.row];
        
        [cell2.pe1Image sd_setImageWithURL:[NSURL URLWithString:hImage.imgsrc]];
        
        [cell2.pe2Image sd_setImageWithURL:[NSURL URLWithString:[hImage.imgextra[0] objectForKey:@"imgsrc"]]];
        [cell2.pe3Image sd_setImageWithURL:[NSURL URLWithString:[hImage.imgextra[1] objectForKey:@"imgsrc"]]];
        cell2.peHeadLable.text = hImage.title;
        
        return cell2;
    }
    else
    {
        Pe1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
//        if (indexPath.row == 0)
//        {
//            cell.p1Model = self.arr1[indexPath.row + 1];
//        }
//        else
//        {
//            cell.p1Model = self.arr1[indexPath.row];
//        }
        
        cell.p1Model = self.arr1[indexPath.row];
        return cell;
        
    }
    
  
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PeDetailViewController *peView = [[PeDetailViewController alloc]init];
    PeModel *p = self.arr1[indexPath.row];
    if ([p.digest isEqualToString:@""])
    {
        NSString *s1 = p.photosetID;
        NSString *s2 = [s1 substringFromIndex:4];
        NSString *s4 = [s2 stringByReplacingOccurrencesOfString :@"|" withString:@"/"];
        NSString *s3 = [[NSString alloc]initWithString:[NSString stringWithFormat:@"http://c.3g.163.com/photo/api/set/%@.json",s4]];
        PEPicViewController *pePic = [[PEPicViewController alloc]init];
        pePic.PePicStr = s3;
        [self.navigationController pushViewController:pePic animated:YES];

    }
    else
    {
        peView.detailWebUrl = p.url;
        [self.navigationController pushViewController:peView animated:YES];
    }
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
