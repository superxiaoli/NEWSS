//
//  Pe1TableViewCell.m
//  News
//
//  Created by Xcord-LS on 15/10/19.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "Pe1TableViewCell.h"

@implementation Pe1TableViewCell


-(UIImageView *)peImage
{
    if (_peImage == nil)
    {
        self.peImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80,80)];
        //self.picImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_peImage];
    }
    return _peImage;
}


-(UILabel *)titleLable
{
    if (_titleLable == nil)
    {
        self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.peImage.frame), CGRectGetMinY(self.peImage.frame), 250, 40)];
        //self.songLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_titleLable];
    }
    return _titleLable;
    
}

-(UILabel *)degestLable
{
    if (_degestLable == nil)
    {
        self.degestLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.peImage.frame), CGRectGetMinY(self.peImage.frame) + 25, 250, 40)];
        self.degestLable.font = [UIFont systemFontOfSize:14];
        self.degestLable.numberOfLines = 0;
        //self.songLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_degestLable];
    }
    return _degestLable;
    
}



-(void)setP1Model:(PeModel *)p1Model
{
    [self.peImage sd_setImageWithURL:[NSURL URLWithString:p1Model.imgsrc]];
    self.titleLable.text = p1Model.title;
    self.degestLable.text = p1Model.digest;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
