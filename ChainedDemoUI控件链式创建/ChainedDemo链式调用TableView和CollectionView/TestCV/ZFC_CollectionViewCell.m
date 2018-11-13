//
//  ZFC_CollectionViewCell_XIB.m
//  ChainDemo
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFC_CollectionViewCell.h"

@implementation ZFC_CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
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
