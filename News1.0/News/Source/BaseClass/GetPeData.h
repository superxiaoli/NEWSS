//
//  GetPeData.h
//  News
//
//  Created by Xcord-LS on 15/10/19.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^peValue)(NSArray *arr1,NSArray *arr2,NSArray *arr3);




@interface GetPeData : NSObject

@property (nonatomic,strong)NSMutableArray *pe1Array;

@property (nonatomic,strong)NSMutableArray *pe2Array;

@property (nonatomic,strong)NSMutableArray *pe3Array;


+(instancetype)sharePeHandleData;

-(void)getDataWithUrl:(NSString *)URL PeValue:(peValue) peValue;







@end
