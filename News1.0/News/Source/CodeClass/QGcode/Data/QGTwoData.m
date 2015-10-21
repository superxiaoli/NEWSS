//
//  QGTwoData.m
//  News
//
//  Created by zhaoliangyu on 15/10/21.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "QGTwoData.h"
static QGTwoData * data = nil;
@implementation QGTwoData
+(instancetype)shareGetData
{
    if (data == nil) {
        static dispatch_once_t once_token;
        
        dispatch_once(&once_token, ^{
            data = [[QGTwoData alloc]init];
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
        self.dataArray = [NSMutableArray array];
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            NSDictionary * dict = [NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
          
           self.dataArray = [dict objectForKey:@"photos"];
            
              passValue(self.dataArray);
        }];
      
    });
}
@end
