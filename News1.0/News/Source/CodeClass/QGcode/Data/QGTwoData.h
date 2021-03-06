//
//  QGTwoData.h
//  News
//
//  Created by zhaoliangyu on 15/10/21.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PassValue)(NSArray * array);
@interface QGTwoData : NSObject
@property(nonatomic,strong)NSMutableArray * dataArray;

+(instancetype)shareGetData;

-(void)getDataWithURL:(NSString *)URL PassValue:(PassValue)passValue;
@end
