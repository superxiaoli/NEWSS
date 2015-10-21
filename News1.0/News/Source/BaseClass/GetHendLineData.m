//
//  GetHendLineData.m
//  News
//
//  Created by Xcord-LS on 15/10/16.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "GetHendLineData.h"
#import "HeadLine.h"
#import "HeadLineAds.h"
#import "HeadLineImage.h"
static GetHendLineData *gd = nil;
@implementation GetHendLineData




+(instancetype)shareHandLineData
{
    if (gd == nil)
    {
        //dispatch_once_t 用于检查该代码块是否已经被调度谓词
        //dispatch_once不仅意味着代码仅会被运行一次，而且还是线程安全的，这就意味着你不需要使用诸如@synchronized之类的来防止使用多个线程或者队列时不同步的问题。
        static dispatch_once_t once_token;
        dispatch_once(&once_token,^{
            gd = [[GetHendLineData alloc]init];
            
        });
    }
    return gd;
}

-(void)getDataWithUrl:(NSString *)URL PassValue:(PassValue)passValue
{
    NSURL *url = [NSURL URLWithString:URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        self.dataArray = [NSMutableArray array];
     
        self.aArr = [NSMutableArray array];
        for (NSDictionary *d  in [dic objectForKey:@"T1348647909107"])
        {
            HeadLine *h = [[HeadLine alloc]init];
            [h setValuesForKeysWithDictionary:d];
            [self.dataArray addObject:h];
            
         
        }
        passValue(self.dataArray);
    }];


}

-(void)getAdsWithUrl:(NSString *)URL PassValue:(adsValue) adsValue
{
    NSURL *url = [NSURL URLWithString:URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    /*
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        
//        self.dataArray = [NSMutableArray array];
//        
//        self.aArr = [NSMutableArray array];
//        for (NSDictionary *d  in [dic objectForKey:@"T1348647909107"])
//        {
//              HeadLine *h = [[HeadLine alloc]init];
//              [h setValuesForKeysWithDictionary:d];
//            
//            NSMutableArray *aArr = [NSMutableArray array];
//            if (h.ads != nil)
//            {
//                for (NSDictionary *d in h.ads )
//                {
//                    HeadLineAds *h = [[HeadLineAds alloc]init];
//                    [h setValuesForKeysWithDictionary:d];
//                    [aArr addObject:h];
//                    
//                }
//                
//
//            }
//            
//            self.aArr = aArr;
//            
//        }
//        adsValue(self.aArr);
//    }];*/
    
    
    [request setHTTPMethod:@"GET"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    for (NSDictionary *d  in [dictionary objectForKey:@"T1348647909107"])
                {
                      HeadLine *h = [[HeadLine alloc]init];
                      [h setValuesForKeysWithDictionary:d];
        
//                    NSMutableArray *aArr = [NSMutableArray array];
                    if (h.ads != nil)
                    {
                        for (NSDictionary *dd in h.ads )
                        {
                            HeadLineAds *hh = [[HeadLineAds alloc]init];
                            [hh setValuesForKeysWithDictionary:dd];
                          
                            [self.aArr addObject:hh];
        
                        }
                    }
                    if (h.digest != nil)
                    {
                        for (NSDictionary *dic1 in h.imgextra)
                        {
                            HeadLineImage *hImage = [[HeadLineImage alloc]init];
                            [hImage setValuesForKeysWithDictionary:dic1];
                            [self.imageArr addObject:hImage];
                        }
                    }
                }
    adsValue(self.aArr,self.imageArr);
}



//懒加载初始化数组
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil)
    {
        
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


-(NSMutableArray *)aArr
{
    if (_aArr == nil) {
        _aArr = [NSMutableArray array];
    }
    return _aArr;
}

-(NSMutableArray *)imageArr
{
    if (_imageArr == nil) {
        _imageArr = [NSMutableArray array];
    }
    return _imageArr;
}



@end
