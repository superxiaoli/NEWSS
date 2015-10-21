//
//  GetPeData.m
//  News
//
//  Created by Xcord-LS on 15/10/19.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "GetPeData.h"
#import "PeModel.h"
#import "Pe2Model.h"
#import "Pe3Model.h"
static GetPeData *gpd = nil;
@implementation GetPeData

+(instancetype)sharePeHandleData
{
    if (gpd == nil)
    {
        //dispatch_once_t 用于检查该代码块是否已经被调度谓词
        //dispatch_once不仅意味着代码仅会被运行一次，而且还是线程安全的，这就意味着你不需要使用诸如@synchronized之类的来防止使用多个线程或者队列时不同步的问题。
        static dispatch_once_t once_token;
        dispatch_once(&once_token,^{
            gpd = [[GetPeData alloc]init];
            
        });
    }
    return gpd;
}


-(void)getDataWithUrl:(NSString *)URL PeValue:(peValue) peValue
{
    NSURL *url = [NSURL URLWithString:URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    self.pe1Array = [NSMutableArray array];
    
    for (NSDictionary *dic  in [dictionary objectForKey:@"T1348649079062"])
    {
        PeModel *m = [[PeModel alloc]init];
        [m setValuesForKeysWithDictionary:dic];
        
        
        [self.pe1Array addObject: m];
        if (m.ads != nil)
        {
            for (NSDictionary *dic2 in m.ads)
            {
                Pe2Model *m2 = [[Pe2Model alloc]init];
                [m2 setValuesForKeysWithDictionary:dic2];
                [self.pe2Array addObject:m2];
            }
        }
       
        
        if (m.digest != nil)
        {
            for (NSDictionary *dic3 in m.imgextra)
            {
                Pe3Model *p3Image = [[Pe3Model alloc]init];
                [p3Image setValuesForKeysWithDictionary:dic3];
                [self.pe3Array addObject:p3Image];
            }
        }
    }
    peValue(self.pe1Array,self.pe2Array,self.pe3Array);
    
}



-(NSMutableArray *)pe1Array
{
    if (_pe1Array == nil)
    {
        
        _pe1Array = [NSMutableArray array];
    }
    return _pe1Array;
}
-(NSMutableArray *)pe2Array
{
    if (_pe2Array == nil)
    {
        
        _pe2Array = [NSMutableArray array];
    }
    return _pe2Array;
}


@end
