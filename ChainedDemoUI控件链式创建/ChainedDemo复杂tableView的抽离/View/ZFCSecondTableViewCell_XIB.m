//
//  ZFCSecondTableViewCell_XIB.m
//  ChainedDemo03-复杂tableView的抽离
//
//  Created by mac on 2018/11/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFCSecondTableViewCell_XIB.h"
#import "ZFCTestRowModel.h"

@implementation ZFCSecondTableViewCell_XIB

- (void)config:(UITableViewCell *)cell
     cellModel:(ZFCTestRowModel *)model
     indexPath:(NSIndexPath *)indexPath
{
    self.myImageView.image = [UIImage imageNamed:model.iconString];
}

@end
