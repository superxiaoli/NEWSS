//
//  Pe2TableViewCell.m
//  News
//
//  Created by Xcord-LS on 15/10/19.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "Pe2TableViewCell.h"

@implementation Pe2TableViewCell


-(UILabel *)peHeadLable
{
    if (_peHeadLable == nil)
    {
        self.peHeadLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 355, 20)];
        [self.contentView addSubview:_peHeadLable];
    }
    return _peHeadLable;
}



-(UIImageView *)pe1Image
{
    if (_pe1Image == nil)
    {
        self.pe1Image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, (CGRectGetWidth(self.frame) - 40) / 3, 80)];
        [self.contentView addSubview:_pe1Image];
    }
    return _pe1Image;
}



-(UIImageView *)pe2Image
{
    if (_pe2Image == nil)
    {
        self.pe2Image = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.pe1Image.frame) + 10, CGRectGetMinY(self.pe1Image.frame), (CGRectGetWidth(self.frame) - 40) / 3, 80)];
        [self.contentView addSubview:_pe2Image];
    }
    return _pe2Image;
}


-(UIImageView *)pe3Image
{
    if (_pe3Image == nil)
    {
        self.pe3Image = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.pe2Image.frame) + 10, CGRectGetMinY(self.pe1Image.frame), (CGRectGetWidth(self.frame) - 40) / 3, 80)];
        [self.contentView addSubview:_pe3Image];
    }
    return _pe3Image;
}











- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
