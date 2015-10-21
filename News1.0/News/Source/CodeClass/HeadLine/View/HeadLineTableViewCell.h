//
//  HeadLineTableViewCell.h
//  News
//
//  Created by Xcord-LS on 15/10/16.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadLineTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *headLineImage;
@property (nonatomic,strong)UILabel *HeadtitleLable;
@property (nonatomic,strong)UILabel *headDegest;


@property (nonatomic,strong)HeadLine *headLine;



@end
