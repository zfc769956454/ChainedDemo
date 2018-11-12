//
//  CustomeTableViewCell.m
//  ChainDemo
//
//  Created by mac on 2018/11/7.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFCTableViewCell_XIB.h"
#import "ZFCTestRowModel.h"

@implementation ZFCTableViewCell_XIB

- (void)config:(UITableViewCell *)cell
     cellModel:(ZFCTestRowModel *)model
     indexPath:(NSIndexPath *)indexPath
{
    self.myLabel.text = model.testString;
}

@end
