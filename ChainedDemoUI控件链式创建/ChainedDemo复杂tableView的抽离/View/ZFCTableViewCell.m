//
//  ZFC_CustomTableViewCell.m
//  ChainDemo
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFCTableViewCell.h"
#import "ZFCTestRowModel.h"

@implementation ZFCTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.myLabel = [UILabel new];
        [self.contentView addSubview:self.myLabel];
        
    }
    
    return self;
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.myLabel.frame = self.contentView.bounds;
}


- (void)config:(UITableViewCell *)cell
     cellModel:(ZFCTestRowModel *)model
     indexPath:(NSIndexPath *)indexPath
{
    self.myLabel.text = model.testString;
}

@end
