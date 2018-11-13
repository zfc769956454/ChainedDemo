//
//  CustomeHeaderView.m
//  ChainDemo
//
//  Created by mac on 2018/11/7.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFC_TableViewHeaderFooterView.h"

@implementation ZFC_TableViewHeaderFooterView

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
