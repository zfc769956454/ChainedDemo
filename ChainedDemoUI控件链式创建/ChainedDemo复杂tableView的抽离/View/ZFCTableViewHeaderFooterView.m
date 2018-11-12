//
//  CustomeSectionHeaderView.m
//  ChainDemo
//
//  Created by mac on 2018/11/7.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFCTableViewHeaderFooterView.h"

@implementation ZFCTableViewHeaderFooterView

- (instancetype) initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
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
