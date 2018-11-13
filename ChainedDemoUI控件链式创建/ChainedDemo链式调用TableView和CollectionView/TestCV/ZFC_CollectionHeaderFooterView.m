//
//  ZFC_CollectionHeaderFooterView.m
//  ChainDemo
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFC_CollectionHeaderFooterView.h"

@implementation ZFC_CollectionHeaderFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.myView = [UIView new];
        [self addSubview:self.myView];
        
        self.myLabel = [UILabel new];
        [self addSubview:self.myLabel];
        
    }
    
    return self;
    
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.myView.frame = self.bounds;
    self.myLabel.frame = self.bounds;
    
    
}


@end
