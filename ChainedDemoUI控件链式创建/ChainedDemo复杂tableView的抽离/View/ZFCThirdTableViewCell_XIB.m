//
//  ZFCThirdTableViewCell_XIB.m
//  ChainedDemo03-复杂tableView的抽离
//
//  Created by mac on 2018/11/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFCThirdTableViewCell_XIB.h"
#import "ZFCTestRowModel.h"

@implementation ZFCThirdTableViewCell_XIB

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor yellowColor];
}


- (void)config:(UITableViewCell *)cell
     cellModel:(ZFCTestRowModel *)model
     indexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",model.testString);
}

@end
