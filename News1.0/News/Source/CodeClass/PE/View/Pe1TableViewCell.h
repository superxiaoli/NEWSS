//
//  Pe1TableViewCell.h
//  News
//
//  Created by Xcord-LS on 15/10/19.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeModel.h"
@interface Pe1TableViewCell : UITableViewCell


@property (nonatomic,strong)UIImageView *peImage;
@property (nonatomic,strong)UILabel *titleLable;
@property (nonatomic,strong)UILabel *degestLable;

@property (nonatomic,strong)PeModel *p1Model;






@end
