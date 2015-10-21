//
//  QGheaderModel.h
//  News
//
//  Created by zhaoliangyu on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QGheaderModel : NSObject
@property(nonatomic,strong)NSString * alias;
@property(nonatomic,strong)NSString * cid;
@property(nonatomic,strong)NSString * digest;
@property(nonatomic,strong)NSString * docid;
@property(nonatomic,strong)NSString * ename;
@property(nonatomic,strong)NSString * hasAD;
@property(nonatomic,strong)NSString * hasCover;
@property(nonatomic,strong)NSString * hasHead;
@property(nonatomic,strong)NSString * haslcon;
@property(nonatomic,strong)NSString * haslmg;
@property(nonatomic,strong)NSString * imgsrc;
@property(nonatomic,strong)NSString * lmodify;
@property(nonatomic,strong)NSString * order;
@property(nonatomic,strong)NSString * photosetID;
@property(nonatomic,strong)NSString * priority;
@property(nonatomic,strong)NSString * ptime;
@property(nonatomic,strong)NSString * replyCount;
@property(nonatomic,strong)NSMutableString * skipID;
@property(nonatomic,strong)NSString * skipType;
@property(nonatomic,strong)NSString * aTemplate;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * tname;

@property(nonatomic,strong)NSString * boardid;
@property(nonatomic,strong)NSString * source;
@property(nonatomic,strong)NSString * subtitle;
@property(nonatomic,strong)NSString * url;
@property(nonatomic,strong)NSString * url_3w;
@property(nonatomic,strong)NSString * votecount;
@property(nonatomic,strong)NSArray * imgextra;
@end
