//
//  PresViewController.m
//  ChainDemo
//
//  Created by 富成赵 on 2018/8/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFC_TestViewController.h"
#import <ZFC_ChainedCreaterHeader.h>

#import "ZFC_TableViewCell.h"
#import "ZFC_TableViewHeaderFooterView.h"
#import "ZFC_TableViewCell_XIB.h"
#import "ZFC_TableViewHeaderFooterView_XIB.h"



#import "ZFC_CollectionViewCell.h"
#import "ZFC_CollectionHeaderFooterView.h"
#import "ZFC_CollectionViewCell_XIB.h"
#import "ZFC_CollectionHeaderFooterView_XIB.h"


static inline Class getClassFromClassString(NSString *classStr,BOOL isXIB) {
    

    Class myClass = isXIB ? NSClassFromString([NSString stringWithFormat:@"%@_XIB",classStr]) : NSClassFromString(classStr) ;
    
    
    return myClass;
}


@interface ZFC_TestViewController ()

@property (strong, nonatomic) NSMutableArray *dataSource;

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UICollectionView *collectionView;


@end

@implementation ZFC_TestViewController

- (NSMutableArray *)dataSource {
    
    if(_dataSource == nil) {
        _dataSource = [NSMutableArray array];
        for(NSInteger i = 0; i < 2; i++) {
            [_dataSource addObject:[NSString stringWithFormat:@"测试:%ld",i]];
        }
    }
    return _dataSource;
    
}

- (UITableView *)tableView {
    
    if(_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


- (UICollectionView *)collectionView {
    
    if (_collectionView  == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 10.0f;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor whiteColor];
    
    
    __weak typeof(self) ws = self;
    [UIButton ZFC_ButtonChainedCreater:^(ZFC_ButtonChainedCreater *creater) {
        creater.backgroundColor([UIColor lightGrayColor])
        .frame(CGRectMake(0, 20, 44, 44))
        .title(@"返回", UIControlStateNormal)
        .titleColor([UIColor blackColor], UIControlStateNormal)
        .titleLabelFont([UIFont systemFontOfSize:15])
        .addIntoView(self.view)
        .actionBlock(^(UIButton *button) {
             [ws dismissViewControllerAnimated:YES completion:nil];
        });
    }];
    
    
    if (self.isTableViewTest) {
        [self chainedTableView];
    }else {
        [self chainedCollectionView];
    }
}





- (void)chainedTableView {
    

    //tableView的链式调用
    __block BOOL isXIB = YES;
    ZFC_TableViewChainedInvokeConfig *tableViewConfig = [ZFC_TableViewChainedInvokeConfig new];
    tableViewConfig.tableView = self.tableView;
    tableViewConfig.isCellXib = isXIB;
    tableViewConfig.cellClass = [getClassFromClassString(@"ZFC_TableViewCell", isXIB) class];
    tableViewConfig.isSectionHeaderXib = isXIB;
    tableViewConfig.sectionHeaderClass = [getClassFromClassString(@"ZFC_TableViewHeaderFooterView", isXIB) class];
    tableViewConfig.isSectionFooterXib = isXIB;
    tableViewConfig.sectionFooterClass = [getClassFromClassString(@"ZFC_TableViewHeaderFooterView", isXIB) class];
    tableViewConfig.canDelete = YES;
    
    __weak typeof(self)weakSelf = self;
    [self.tableView configure:^(ZFC_TableViewChainedInvokeCreater *creater) {
       
        creater.zfc_tableViewConfigure(tableViewConfig)
        
        .zfc_numberOfSectionsInTableView(^NSInteger(UITableView *tableView){
            return 3;
        })
        .zfc_numberOfRowsInSection(^NSInteger(UITableView *tableView,NSInteger section) {
            return weakSelf.dataSource.count;
            
        })
        .zfc_heightForRowAtIndexPath(^CGFloat(UITableView *tableView,NSIndexPath *indexPath) {
            
            return 50;
        })
        .zfc_cellForRowAtIndexPath(^(UITableView *tableView,__kindof ZFC_TableViewCell *cell, NSIndexPath *indexPath) {

            cell.myLabel.text = [NSString stringWithFormat:@"%@%@",weakSelf.dataSource[indexPath.row],isXIB?@"->XIB":@""];

            cell.contentView.backgroundColor = [UIColor grayColor];

        })
        .zfc_heightForHeaderInSection(^CGFloat(UITableView *tableView,NSInteger section) {

            return 40;
        })
        .zfc_viewForHeaderInSection(^(UITableView *tableView,__kindof ZFC_TableViewHeaderFooterView *headerView,NSInteger section) {
            
            headerView.myLabel.text = [NSString stringWithFormat:@"我是第-- %ld --段头%@",section,isXIB?@"->XIB":@""];
            
            headerView.contentView.backgroundColor = [UIColor yellowColor];
        })
        .zfc_heightForFooterInSection(^CGFloat(UITableView *tableView,NSInteger section) {

            return 40;

        }).zfc_viewForFooterInSection(^(UITableView *tableView,__kindof ZFC_TableViewHeaderFooterView *footerView,NSInteger section) {

            footerView.myLabel.text = [NSString stringWithFormat:@"我是第-- %ld --段尾%@",section,isXIB?@"->XIB":@""];
            footerView.contentView.backgroundColor = [UIColor blueColor];

        })
        .zfc_deleteCellWithIndexPath(^(UITableView *tableView, NSIndexPath *indexPath) {
            NSLog(@"删除");
            [weakSelf.dataSource removeLastObject];
            [tableView reloadData];
        })
        .zfc_didSelectRowAtIndexPath(^(UITableView *tableView,NSIndexPath *indexPath) {
            NSLog(@"我点击了%@",weakSelf.dataSource[indexPath.row]);
        });
    }];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(NSInteger i = 2; i < 5; i++) {
            [self.dataSource addObject:[NSString stringWithFormat:@"测试:%ld",i]];
        }
        [self.tableView.creater zfc_reloadData];
    });
    
}



- (void)chainedCollectionView {
    
    ZFC_CollectionChainedInvokeConfig *collectionViewConfig = [ZFC_CollectionChainedInvokeConfig new];
    collectionViewConfig.collectionView = self.collectionView;
    
    
    //collectionView的链式调用
    __block BOOL isXIB = YES;
    collectionViewConfig.isCellXib = isXIB;
    collectionViewConfig.cellClass = [getClassFromClassString(@"ZFC_CollectionViewCell", isXIB) class];
    collectionViewConfig.isSectionHeaderXib = isXIB;
    collectionViewConfig.sectionHeaderClass = [getClassFromClassString(@"ZFC_CollectionHeaderFooterView", isXIB) class];
    collectionViewConfig.isSectionFooterXib = isXIB;
    collectionViewConfig.sectionFooterClass = [getClassFromClassString(@"ZFC_CollectionHeaderFooterView", isXIB) class];
    
    __weak typeof(self)weakSelf = self;
    [self.collectionView configure:^(ZFC_CollectionViewChainnedInvokeCreater *creater) {

        creater.zfc_collectionViewConfigure(collectionViewConfig)
        
        .zfc_numberOfSectionsInCollectionView(^NSInteger(UICollectionView *collectionView){
            return 3;
        })
        .zfc_numberOfItemsInSection(^NSInteger(UICollectionView *collectionView,NSInteger section) {
            return weakSelf.dataSource.count;
        })
        .zfc_sizeForItemAtIndexPath(^CGSize(UICollectionView *collectionView,NSIndexPath *indexPath) {
            return CGSizeMake(115 , 100);
        })
        .zfc_cellForItemAtIndexPath(^(UICollectionView *collectionView,__kindof ZFC_CollectionViewCell *cell, NSIndexPath *indexPath) {
            
            cell.myLabel.text = [NSString stringWithFormat:@"%@%@",weakSelf.dataSource[indexPath.row],isXIB?@"->XIB":@""];
            cell.contentView.backgroundColor = [UIColor redColor];
            
        })
        .zfc_referenceSizeForHeaderInSection(^CGSize(UICollectionView *collectionView, NSInteger section) {
            
            return CGSizeMake(200, 40);
        })
        .zfc_collectionElementKindSectionHeader(^(UICollectionView *collectionView, __kindof ZFC_CollectionHeaderFooterView *sectionHeaderView, NSInteger section) {
    
            sectionHeaderView.myLabel.text = [NSString stringWithFormat:@"我是第-- %ld --段头%@",section,isXIB?@"->XIB":@""];
            sectionHeaderView.myView.backgroundColor = [UIColor greenColor];
            
        })
        .zfc_referenceSizeForFooterInSection(^CGSize(UICollectionView *collectionView, NSInteger section) {
            
            return CGSizeMake(200, 40);
        })
        .zfc_collectionElementKindSectionFooter(^(UICollectionView *collectionView, __kindof ZFC_CollectionHeaderFooterView *sectionFooterView, NSInteger section) {
            
            sectionFooterView.myLabel.text = [NSString stringWithFormat:@"我是第-- %ld --段尾%@",section,isXIB?@"->XIB":@""];
            sectionFooterView.myView.backgroundColor = [UIColor darkGrayColor];
            
        })
        .zfc_didSelectItemAtIndexPath(^(UICollectionView *collectionView, NSIndexPath *indexPath) {
             NSLog(@"我点击了%@",weakSelf.dataSource[indexPath.row]);
        });
        
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(NSInteger i = 2; i < 5; i++) {
            [self.dataSource addObject:[NSString stringWithFormat:@"测试:%ld",i]];
        }
        [self.collectionView.creater zfc_reloadData];
    });
    
}

- (void)dealloc {
    
    NSLog(@"控制器释放了");
    
}
@end
