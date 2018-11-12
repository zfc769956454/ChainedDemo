//
//  ZFCThirdTableViewCell.m
//  ChainedDemo03-复杂tableView的抽离
//
//  Created by mac on 2018/11/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFCThirdTableViewCell.h"
#import "ZFCTestRowModel.h"

@implementation ZFCThirdTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}


- (void)config:(UITableViewCell *)cell
     cellModel:(ZFCTestRowModel *)model
     indexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",model.testString);
}



@end
