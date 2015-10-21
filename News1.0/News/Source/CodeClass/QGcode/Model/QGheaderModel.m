//
//  QGheaderModel.m
//  News
//
//  Created by zhaoliangyu on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "QGheaderModel.h"

@implementation QGheaderModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"template"]) {
        key = @"aTemplate";
    }
}
@end
