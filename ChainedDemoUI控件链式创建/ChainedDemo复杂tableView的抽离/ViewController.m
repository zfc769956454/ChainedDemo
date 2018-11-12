//
//  ViewController.m
//  ChainedDemo复杂tableView的抽离
//
//  Created by mac on 2018/11/12.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import <ZFC_ChainedCreaterHeader.h>

#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIButton ZFC_ButtonChainedCreater:^(ZFC_ButtonChainedCreater *creater) {
        creater.tag(0)
        .frame(CGRectMake(100, 100, 100, 100))
        .backgroundColor([UIColor lightGrayColor])
        .title(@"跳转", UIControlStateNormal)
        .titleLabelFont([UIFont systemFontOfSize:15])
        .addIntoView(self.view)
        .actionBlock(^(UIButton *button) {
            [self testWithTarget];
        });
    }];
    
}

- (void)testWithTarget {
    
    TestViewController *vc = [TestViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


@end
