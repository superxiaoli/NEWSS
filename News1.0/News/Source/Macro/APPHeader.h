//
//  APPHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里存放普通的app宏定义和声明等信息.

#ifndef Project_APPHeader_h
#define Project_APPHeader_h



#import "HeadLine.h"
#import "HeadLineImage.h"
#import "NewsViewController.h"
 // 情感头文件引用
#import "QGheaderModel.h"
#import "QGdata.h"
#import "QGTableViewCell.h"
#import "QGTwoTableViewCell.h"
#import "QGTwoViewController.h"
#import "QGWebView.h"
#import "QGViewController.h"
#import "QGTwoView.h"
#import "QGTwoData.h"
#import "QGTwoModel.h"
#import "QGTableViewController.h"



#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHight CGRectGetHeight([UIScreen mainScreen].bounds)













































//TODO 提示
#define STRINGIFY(S) #S
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" \
DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
#define KEYWORDIFY try {} @catch (...) {}
// 最终使用下面的宏
#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))


#endif
