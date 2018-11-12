//
//  ZFCTestRowModel.h
//  ChainedDemo03-复杂tableView的抽离
//
//  Created by mac on 2018/11/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFC_TableViewRowSuperComplexModel.h"


@interface ZFCTestRowModel : ZFC_TableViewRowSuperComplexModel

@property (nonatomic,copy)NSString *testString;

@property (nonatomic,copy)NSString *iconString;

@end


