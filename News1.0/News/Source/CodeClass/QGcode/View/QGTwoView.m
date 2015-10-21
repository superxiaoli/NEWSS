//
//  QGTwoView.m
//  News
//
//  Created by zhaoliangyu on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "QGTwoView.h"

@implementation QGTwoView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView];
    }
    return self;
}

-(void)p_setupView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 100, self.frame.size.width-10, 300)];
    [self addSubview:_scrollView];
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.scrollView.frame), CGRectGetMaxY(self.scrollView.frame), CGRectGetWidth(self.scrollView.frame), 200)];
    [self addSubview:_textView];
    
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
