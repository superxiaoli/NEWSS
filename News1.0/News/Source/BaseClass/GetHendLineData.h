//
//  GetHendLineData.h
//  News
//
//  Created by Xcord-LS on 15/10/16.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^PassValue)(NSArray *array);
typedef void (^adsValue)(NSArray *arr,NSArray *arr2);

@interface GetHendLineData : NSObject
// 在单例中创建一个属性,可以使这个数组在任何地方任何时间被访问


//// 这是测试gtihup***************

//// 这是测试gtihup




//// 这是测试gtihup***************gagagagagagagag

//// 这是测试gtihup再次测试

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *aArr;
@property (nonatomic,strong)NSMutableArray *imageArr;

+(instancetype)shareHandLineData;


-(void)getDataWithUrl:(NSString *)URL PassValue:(PassValue) passValue;

-(void)getAdsWithUrl:(NSString *)URL PassValue:(adsValue) adsValue;

@end
