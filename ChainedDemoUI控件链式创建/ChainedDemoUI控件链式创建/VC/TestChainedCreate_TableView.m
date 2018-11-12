//
//  TestChainedCreate_TableView.m
//  ChainDeom-控件创建篇
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TestChainedCreate_TableView.h"
#import <ZFC_ChainedCreaterHeader.h>
#import "TestTableViewHeaderFooterView.h"



@interface TestChainedCreate_TableView ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end


@implementation TestChainedCreate_TableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutUI];
    
}



- (void)layoutUI {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    headerView.backgroundColor = [UIColor lightGrayColor];
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    footerView.backgroundColor = [UIColor yellowColor];
    
    //tableView
    self.tableView = [UITableView ZFC_TableViewChainedCreater:^(ZFC_TableViewChainedCreater *creater) {
        creater.frameAndStyle(self.view.bounds, UITableViewStylePlain)
        .backgroundColor([UIColor whiteColor])
        .tag(1)
        .separatorStyleAndColor(UITableViewCellSeparatorStyleSingleLine, [UIColor blueColor])
        .separatorInset(UIEdgeInsetsMake(0, 30, 0, 30))
        .rowHeight(60)
        .sectionFooterHeight(40)
        .sectionFooterHeight(30)
        .tableHeaderView(headerView)
        .tableFooterView(footerView)
        .addIntoView(self.view)
        ;
    }];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[TestTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
    [self.tableView registerClass:[TestTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"footer"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 8;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    TestTableViewHeaderFooterView *headerView = (TestTableViewHeaderFooterView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    headerView.myLabel.backgroundColor = [UIColor cyanColor];
    headerView.myLabel.text = @"我是段头";
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    TestTableViewHeaderFooterView *footerView = (TestTableViewHeaderFooterView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    footerView.myLabel.backgroundColor = [UIColor cyanColor];
    footerView.myLabel.text = @"我是段尾";
    return footerView;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"点击了tableView");
    
}


- (void)dealloc {
    
    NSLog(@"tableView->控制器释放了");
    
}

@end
