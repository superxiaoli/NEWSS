//
//  PIcShowView.m
//  News
//
//  Created by Xcord-LS on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "PIcShowView.h"

@implementation PIcShowView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUpPicView];
    }
    return self;
}


-(void)setUpPicView
{
    self.picView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self addSubview:_picView];
    
    
    
    
    self.picLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 450, 355, 200)];
    self.picLable.numberOfLines = 0;
    self.picLable.backgroundColor = [UIColor clearColor];
    [self.picView addSubview:_picLable];
}






@end
