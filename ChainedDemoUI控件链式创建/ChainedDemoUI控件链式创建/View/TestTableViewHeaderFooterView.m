//
//  TestTableViewHeaderFooterView.m
//  ChainDeom-控件创建篇
//
//  Created by mac on 2018/11/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TestTableViewHeaderFooterView.h"

@implementation TestTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
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
