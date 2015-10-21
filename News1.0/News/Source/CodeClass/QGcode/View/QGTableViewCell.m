//
//  QGTableViewCell.m
//  News
//
//  Created by zhaoliangyu on 15/10/20.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "QGTableViewCell.h"

@implementation QGTableViewCell

-(UIImageView *)aImageVew
{
    if (_aImageVew == nil) {
        self.aImageVew = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.contentView.frame)+5, CGRectGetMinY(self.contentView.frame)+5, 90, CGRectGetHeight(self.contentView.frame)-10)];
//        self.aImageVew.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_aImageVew];
    }
    return _aImageVew;
}

-(UILabel *)oneLabel
{
    if (_oneLabel == nil) {
        self.oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.aImageVew.frame)+5,CGRectGetMinY(self.aImageVew.frame), CGRectGetWidth(self.contentView.frame)-CGRectGetWidth(self.aImageVew.frame)-10, CGRectGetHeight(self.contentView.frame)/2-15)];
        
        self.oneLabel.font = [UIFont systemFontOfSize:15];
        
        [self.contentView addSubview:_oneLabel];
    }
    return _oneLabel;
}

-(UILabel *)twoLabel
{
    if (_twoLabel == nil) {
    
    
    
    self.twoLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.oneLabel.frame), CGRectGetMaxY(self.oneLabel.frame)+5, CGRectGetWidth(self.oneLabel.frame), CGRectGetHeight(self.oneLabel.frame)+14)];
    self.twoLabel.font = [UIFont systemFontOfSize:14];
    
    self.twoLabel.textColor = [UIColor grayColor];
        
        self.twoLabel.numberOfLines = 2;
    
    [self.contentView addSubview:_twoLabel];
        
    }
    return _twoLabel;
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
