//
//  QGTwoTableViewCell.m
//  News
//
//  Created by zhaoliangyu on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "QGTwoTableViewCell.h"

@implementation QGTwoTableViewCell

-(UILabel *)headLabel
{
    if (_headLabel == nil) {
        self.headLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.contentView.frame)+5, 0, CGRectGetWidth(self.contentView.frame)-10, 30)];
        self.headLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_headLabel];
    }
    return _headLabel;
}

-(UIImageView *)oneImageView
{
    if (_oneImageView == nil) {
        self.oneImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.headLabel.frame), CGRectGetMaxY(self.headLabel.frame), CGRectGetWidth(self.contentView.frame)/3-6, CGRectGetHeight(self.contentView.frame)-CGRectGetHeight(self.headLabel.frame)-2)];
        [self.contentView addSubview:_oneImageView];
    }
    return _oneImageView;
}
-(UIImageView *)twoImageView
{
    if (_twoImageView == nil) {
        self.twoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.oneImageView.frame)+4, CGRectGetMinY(self.oneImageView.frame), CGRectGetWidth(self.oneImageView.frame), CGRectGetHeight(self.oneImageView.frame))];
        [self.contentView addSubview:_twoImageView];
    }
    return _twoImageView;
}

-(UIImageView *)threeImageView
{
    if (_threeImageView == nil) {
        self.threeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.twoImageView.frame)+4, CGRectGetMinY(self.twoImageView.frame), CGRectGetWidth(self.twoImageView.frame), CGRectGetHeight(self.twoImageView.frame))];
        NSLog(@"fsfdsdfsdfsdfsdf");
        [self.contentView addSubview:_threeImageView];
    }
    return _threeImageView;
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
