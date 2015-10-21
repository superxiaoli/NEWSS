//
//  Pe1View.m
//  News
//
//  Created by Xcord-LS on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "Pe1View.h"

@implementation Pe1View

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setView];
    }
    return self;
}

-(void)p_setView
{
    self.PeScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-30)];
    
    self.PeScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * 2, 0);
    
    self.PeScrollView.backgroundColor = [UIColor orangeColor];
    self.PeScrollView.pagingEnabled = YES;//设置翻动时候在下一个停留
    [self addSubview:_PeScrollView];
    
    self.image1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 20)];
    [self.PeScrollView addSubview:_image1];
    self.image2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.image1.frame), 0,  CGRectGetWidth(self.image1.frame), CGRectGetHeight(self.image1.frame))];
 
    [self.PeScrollView addSubview:_image2];
    self.PeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.PeScrollView.frame), CGRectGetMaxY(self.PeScrollView.frame), CGRectGetWidth(self.PeScrollView.frame) - 100, 20)];
    [self addSubview:_PeLabel];

    self.PePageController = [[UIPageControl alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.PeScrollView.frame) - 100, CGRectGetMaxY(self.PeScrollView.frame) , 100, 20)];
    self.PePageController.backgroundColor = [UIColor orangeColor];
    self.PePageController.numberOfPages = 2;
    self.PePageController.currentPage = 0;
    [self addSubview:_PePageController];
}


@end
