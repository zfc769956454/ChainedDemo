//
//  ZFC_CustomTableViewCell.m
//  ChainDemo
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFC_TableViewCell.h"

@implementation ZFC_TableViewCell


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

@end
