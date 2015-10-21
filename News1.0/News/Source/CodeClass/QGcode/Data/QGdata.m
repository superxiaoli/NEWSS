//
//  QGdata.m
//  News
//
//  Created by zhaoliangyu on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "QGdata.h"

static QGdata * data = nil;
@implementation QGdata

+(instancetype)shareGetData
{
    if (data == nil) {
        static dispatch_once_t once_token;
        
        dispatch_once(&once_token, ^{
            data = [[QGdata alloc]init];
        });
    }
    return data;
}

-(void)getDataWithURL:(NSString *)URL PassValue:(PassValue)passValue
{
    dispatch_queue_t globl_t = dispatch_get_global_queue(0, 0);
    
    dispatch_async(globl_t, ^{
    
        NSURL * url = [NSURL URLWithString:URL];
        
        NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:url];
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
           
            NSDictionary * dict = [NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            self.dataArray = [NSMutableArray array];
            
            for (NSDictionary * d in [dict objectForKey:@"T1348650839000"]) {
                
                QGheaderModel * model = [[QGheaderModel alloc]init];
                
                [model setValuesForKeysWithDictionary:d];
                
                [self.dataArray addObject:model];
            }
            passValue(self.dataArray);
        }];
        
    });
}
@end
