//
//  ViewController.m
//  ChainedDemo链式调用TableView和CollectionView
//
//  Created by mac on 2018/11/12.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import <ZFC_ChainedCreaterHeader.h>
#import "ZFC_TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = ({
        
        UIButton *btn = [UIButton ZFC_ButtonChainedCreater:^(ZFC_ButtonChainedCreater *creater) {
            creater.tag(0)
            .frame(CGRectMake(100, 100, 100, 100))
            .backgroundColor([UIColor lightGrayColor])
            .title(@"测试tableView", UIControlStateNormal)
            .titleLabelFont([UIFont systemFontOfSize:15])
            .addIntoView(self.view)
            .actionBlock(^(UIButton *button) {
                [self testWithTarget:button.tag];
            });
        }];
        
        btn;
    });
    
    
    [UIButton ZFC_ButtonChainedCreater:^(ZFC_ButtonChainedCreater *creater) {
        creater.tag(1)
        .frame(CGRectMake(100, CGRectGetMaxY(button.frame) + 20, 100, 100))
        .backgroundColor([UIColor lightGrayColor])
        .title(@"测试collectionView", UIControlStateNormal)
        .titleLabelFont([UIFont systemFontOfSize:15])
        .addIntoView(self.view)
        .actionBlock(^(UIButton *button) {
            [self testWithTarget:button.tag];
        });
    }];
    
    
}

- (void)testWithTarget:(NSInteger )tag {
    
    ZFC_TestViewController *vc = [ZFC_TestViewController new];
    vc.isTableViewTest = !tag;
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
