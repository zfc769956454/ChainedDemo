//
//  TestCollectionViewHeaderFooterView.m
//  ChainDeom-控件创建篇
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TestCollectionViewHeaderFooterView.h"

@implementation TestCollectionViewHeaderFooterView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.myLabel = [UILabel new];
        [self addSubview:self.myLabel];
    }
    
    return self;
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.myLabel.frame = self.bounds;
    
}


@end
