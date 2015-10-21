//
//  QGTableViewController.m
//  News
//
//  Created by zhaoliangyu on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "QGTableViewController.h"
#import "MJRefresh.h"
@interface QGTableViewController ()
{
    NSInteger integer;
}
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)UIImageView * headImageView;
@property(nonatomic,strong)NSMutableString * urlString;

@end

@implementation QGTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.tableView registerClass:[QGTableViewCell class] forCellReuseIdentifier:@"onecell"];
    
    [self.tableView registerClass:[QGTwoTableViewCell class] forCellReuseIdentifier:@"twocell"];
    
    // 数据请求
//    [self p_getData];
    
    // 刷新的事件
    integer = 0;
    [self.tableView addHeaderWithTarget:self action:@selector(headerLoadAction)];
    [self.tableView headerBeginRefreshing];
    [self.tableView addFooterWithTarget:self action:@selector(footerLoadAction)];
    
    NSLog(@"-----%ld",self.dataArray.count);
    // 设置tableView头部点击事件
    
    [self clickHead];
   

}
-(void)headerLoadAction
{
    integer = 20;
    [self p_getData];
}
-(void)footerLoadAction
{
    integer += 20;
    if (integer < 200) {
        [self p_getData];
    }else
    {
        [self.tableView  footerEndRefreshing];
    }
}



-(void)clickHead
{
       _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 220)];
    
    UITapGestureRecognizer * gesture  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHeadAction)];
    
    self.headImageView.userInteractionEnabled = YES;
    
    [self.headImageView addGestureRecognizer:gesture];
}
-(void)clickHeadAction
{
    
}
-(void)p_getData
{
    [[QGdata shareGetData]getDataWithURL:[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348650839000/%ld-20.html",integer] PassValue:^(NSArray *array) {
        
        if (integer == 20) {
            self.dataArray = [NSMutableArray arrayWithArray:array];
        }
        else
        {
            for (QGheaderModel * model in array) {
                [self.dataArray addObject:model];
            }
        }
        
        
        
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240)];
        
     
       
        
        UILabel * label = [[UILabel  alloc]initWithFrame:CGRectMake(CGRectGetMinX(view.frame)+10, CGRectGetMaxY(_headImageView.frame), CGRectGetWidth(self.view.frame), 20)];
        
        label.font = [UIFont systemFontOfSize:12];
        
        [view addSubview:_headImageView];
        
        [view addSubview:label];
        
        QGheaderModel * model = self.dataArray[0];
        
        label.text = model.title;
        
        [_headImageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        
        NSLog(@"-----%ld",self.dataArray.count);
        self.tableView.tableHeaderView = view;
        
        [self.tableView footerEndRefreshing];
        [self.tableView headerEndRefreshing];
        
        dispatch_async(dispatch_get_main_queue(), ^{
        
            [self.tableView reloadData];
            
        });
        
     
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.dataArray.count -1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QGheaderModel * model = self.dataArray[indexPath.row+1];
    
    if (model.imgextra == nil) {
        QGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"onecell" forIndexPath:indexPath];
        
        
        [cell.aImageVew sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        
        cell.oneLabel.text = model.title;
        
        cell.twoLabel.text = model.digest;
        
        return cell;
    }else
    {
        QGTwoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"twocell" forIndexPath:indexPath];
        [cell.oneImageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        [cell.twoImageView sd_setImageWithURL:[NSURL URLWithString:[model.imgextra[0] objectForKey:@"imgsrc"]]];
        
        [cell.threeImageView sd_setImageWithURL:[NSURL URLWithString:[model.imgextra[1] objectForKey:@"imgsrc"]]];
        
        cell.headLabel.text = model.title;
        return cell;
    }
    
    // Configure the cell...
    
//    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QGheaderModel * model = self.dataArray[indexPath.row+1];

    if (model.imgextra == nil) {
        return 80;
    }else
    {
        return 120;
    }
    
//    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QGheaderModel * model = self.dataArray[indexPath.row+1];

    if ([model.digest isEqualToString:@""]) {
      
        QGTwoViewController * qgViewController = [[QGTwoViewController alloc]init];
        
        NSArray * arr = [model.photosetID componentsSeparatedByString:@"|"];
        NSInteger integer = changeUrl.length;
        
        NSMutableString * str = [NSMutableString stringWithFormat:@"%@",changeUrl];
        [str replaceCharactersInRange:NSMakeRange(integer-10, 5) withString:arr[1]];
        
        [self.navigationController pushViewController:qgViewController animated:YES];
        
        qgViewController.urlStr = str;
    }else
    {
        QGViewController * qgVC = [[QGViewController alloc]init];
        qgVC.urlStr = model.url;
        [self.navigationController pushViewController:qgVC animated:YES];
    }
    
    
    
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
