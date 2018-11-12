//
//  ZFCSecondTableViewCell.m
//  ChainedDemo03-复杂tableView的抽离
//
//  Created by mac on 2018/11/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFCSecondTableViewCell.h"
#import "ZFCTestRowModel.h"

@implementation ZFCSecondTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.myImageView = [UIImageView new];
        [self.contentView addSubview:self.myImageView];
        
    }
    
    return self;
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.myImageView.frame = self.contentView.bounds;
}


- (void)config:(UITableViewCell *)cell
     cellModel:(ZFCTestRowModel *)model
     indexPath:(NSIndexPath *)indexPath
{
    self.myImageView.image = [UIImage imageNamed:model.iconString];
}



@end
