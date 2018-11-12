//
//  ViewController.m
//  ChainedDemo常见UI控件链式创建
//
//  Created by mac on 2018/11/12.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import <ZFC_ChainedCreaterHeader.h>

#import "TestChainedCreate_CollectionView.h"
#import "TestChainedCreate_TableView.h"
#import "TestChainedCreate_OtherView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *button = ({
        
        UIButton *btn = [UIButton ZFC_ButtonChainedCreater:^(ZFC_ButtonChainedCreater *creater) {
            creater.tag(0)
            .frame(CGRectMake(self.view.frame.size.width/2 - 100, 100, 200, 60))
            .backgroundColor([UIColor lightGrayColor])
            .title(@"测试tableView", UIControlStateNormal)
            .titleLabelFont([UIFont systemFontOfSize:15])
            .addIntoView(self.view)
            .actionBlock(^(UIButton *button) {
                [self testWithTarget:button];
            });
        }];
        
        btn;
    });
    
    
    UIButton *button2 = ({
        
        UIButton *btn = [UIButton ZFC_ButtonChainedCreater:^(ZFC_ButtonChainedCreater *creater) {
            creater.tag(1)
            .frame(CGRectMake(self.view.frame.size.width/2 - 100, CGRectGetMaxY(button.frame) + 20, 200, 60))
            .backgroundColor([UIColor lightGrayColor])
            .title(@"测试collectionView", UIControlStateNormal)
            .titleLabelFont([UIFont systemFontOfSize:15])
            .addIntoView(self.view)
            .actionBlock(^(UIButton *button) {
                [self testWithTarget:button];
            });
        }];
        
        btn;
    });
    
    
    [UIButton ZFC_ButtonChainedCreater:^(ZFC_ButtonChainedCreater *creater) {
        creater.tag(2)
        .frame(CGRectMake(self.view.frame.size.width/2 - 100, CGRectGetMaxY(button2.frame) + 20, 200, 60))
        .backgroundColor([UIColor lightGrayColor])
        .title(@"测试otherView", UIControlStateNormal)
        .titleLabelFont([UIFont systemFontOfSize:15])
        .addIntoView(self.view)
        .actionBlock(^(UIButton *button) {
            [self testWithTarget:button];
        });
    }];
    
}


- (void)testWithTarget:(UIButton *)button {
    
    UIViewController *vc = nil;
    if (button.tag == 0) {
        vc = [TestChainedCreate_TableView new];
    }else if(button.tag == 1){
        vc = [TestChainedCreate_CollectionView new];
    }else {
        vc = [TestChainedCreate_OtherView new];
    }
    [self.navigationController pushViewController:vc animated:YES];
}


@end
