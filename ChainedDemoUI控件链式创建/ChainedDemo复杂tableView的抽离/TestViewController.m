//
//  TestViewController.m
//  ChainedDemo03-复杂tableView的抽离
//
//  Created by mac on 2018/11/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TestViewController.h"
#import <ZFC_ChainedCreaterHeader.h>

#import "ZFCTableViewHeaderFooterView.h"
#import "ZFCTableViewCell_XIB.h"
#import "ZFCTableViewHeaderFooterView_XIB.h"


#import "ZFCTestSectionModel.h"
#import "ZFCTestRowModel.h"

@interface TestViewController ()
{
    
    BOOL _isXIB;
    
}

@property (strong, nonatomic) UITableView *tableview;
@property (strong, nonatomic) ZFC_TableViewComplexConfig *tableViewConfig;

@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation TestViewController

- (NSMutableArray *)dataSource {
    
    if (_dataSource == nil) {
        
        _dataSource = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 5; i++) {
            
            ZFCTestSectionModel *sectionModel = [ZFCTestSectionModel new];
            
            for (NSInteger j = 0; j < 3; j++) {
                
                ZFCTestRowModel *rowModel = [ZFCTestRowModel new];
                if (j == 0) {
                    rowModel.cellIdentifier = [NSString stringWithFormat:@"ZFCTableViewCell%@",_isXIB?@"_XIB":@""];
                    rowModel.cellHeight = 30;
                }else if (j == 1) {
                    rowModel.cellIdentifier = [NSString stringWithFormat:@"ZFCSecondTableViewCell%@",_isXIB?@"_XIB":@""];
                    rowModel.cellHeight = 50;
                }else {
                    rowModel.cellIdentifier = [NSString stringWithFormat:@"ZFCThirdTableViewCell%@",_isXIB?@"_XIB":@""];
                    rowModel.cellHeight = 60;
                }
                rowModel.testString = [NSString stringWithFormat:@"我是%ld段-%ld行",i,j];
                rowModel.iconString = @"1.jpg";
                [sectionModel.sectionArray addObject:rowModel];
            }
            [_dataSource addObject:sectionModel];
        }
        
    }
    return _dataSource;
}


- (UITableView *)tableview {
    
    if (_tableview == nil) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
        _tableview.backgroundColor = [UIColor whiteColor];
    }
    return _tableview;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self layoutUI];
    
    
    
}


- (void)layoutUI {
    
    _isXIB = YES;
    
    TableViewCellConfigBlock cellConfigBlock = ^(NSIndexPath* indexPath,UITableViewCell* cell,id model){
        
        [cell config:cell cellModel:model indexPath:indexPath];
    };
    
    TableViewHeaderHeightBlock headerHeightConfigBlock = ^CGFloat(NSInteger section, id secModel) {
        return 45;
    };
    
    TableViewSectionHeaderViewConfigBlock sectionHeaderViewConfigBlock = ^(NSInteger section,ZFCTableViewHeaderFooterView *headerView,id model){
        
        headerView.myLabel.backgroundColor = [UIColor cyanColor];
        headerView.myLabel.text = @"我是段头";
        
    };
    
    
    TableViewFooterHeightBlock sectionFooterHeightConfigBlock = ^CGFloat(NSInteger section, id secModel){
        
        return 35;
    };
    
    TableViewSectionFooterViewConfigBlock sectionFooterViewConfigBlock = ^(NSInteger section,ZFCTableViewHeaderFooterView *footerView,id model) {
        
        footerView.myLabel.backgroundColor = [UIColor blueColor];
        footerView.myLabel.text = @"我是段尾";
    };
    
    
    TableViewCellDidSelectBlock didSelectedBlock = ^(NSIndexPath* indexPath,id cell,ZFC_TableViewRowSuperComplexModel *model){
        
        NSLog(@"点击了");
    };
    
    TableViewCellDeleteBlock deleteBlock = ^BOOL(NSIndexPath* indexPath,ZFC_TableViewRowSuperComplexModel *model){
        
        return YES;
    };
    self.tableViewConfig=[[ZFC_TableViewComplexConfig alloc]initWithDataSource:self.dataSource
                                                                      sections:5
                                                              headerIdentifier:[NSString stringWithFormat:@"ZFCTableViewHeaderFooterView%@",_isXIB?@"_XIB":@""]
                                                              footerIdentifier:[NSString stringWithFormat:@"ZFCTableViewHeaderFooterView%@",_isXIB?@"_XIB":@""]
                                                                     isCellNib:_isXIB
                                                            isSectionHeaderNib:_isXIB
                                                            isSectionFooterNib:_isXIB
                                                                   isCanDelete:YES
                                                               configCellBlock:cellConfigBlock
                                                  configSectionHeaderViewBlock:sectionHeaderViewConfigBlock
                                                  configSectionFooterViewBlock:sectionFooterViewConfigBlock
                                                             headerHeightBlock:headerHeightConfigBlock
                                                             footerHeightBlock:sectionFooterHeightConfigBlock
                                                                didSelectBlock:didSelectedBlock
                                                                   deleteBlock:deleteBlock];
    [self.tableViewConfig setTableViewDelegateAndDataSource:self.tableview];
    [self.view addSubview:self.tableview];
    
}


- (void)dealloc {
    NSLog(@"释放了");
    
}


@end
