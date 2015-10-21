//
//  HeadLine2TableViewCell.m
//  News
//
//  Created by Xcord-LS on 15/10/17.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "HeadLine2TableViewCell.h"

@implementation HeadLine2TableViewCell

-(UILabel *)headLable
{
    if (_headLable == nil)
    {
        self.headLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 355, 20)];
        [self.contentView addSubview:_headLable];
    }
    return _headLable;
}



-(UIImageView *)firstImage
{
    if (_firstImage == nil)
    {
        self.firstImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, (CGRectGetWidth(self.frame) - 40) / 3, 80)];
        [self.contentView addSubview:_firstImage];
    }
    return _firstImage;
}



-(UIImageView *)SecondImage
{
    if (_SecondImage == nil)
    {
        self.SecondImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.firstImage.frame) + 10, CGRectGetMinY(self.firstImage.frame), (CGRectGetWidth(self.frame) - 40) / 3, 80)];
        [self.contentView addSubview:_SecondImage];
    }
    return _SecondImage;
}


-(UIImageView *)ThirdImage
{
    if (_ThirdImage == nil)
    {
        self.ThirdImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.SecondImage.frame) + 10, CGRectGetMinY(self.firstImage.frame), (CGRectGetWidth(self.frame) - 40) / 3, 80)];
        [self.contentView addSubview:_ThirdImage];
    }
    return _ThirdImage;
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
