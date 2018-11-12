//
//  TestChainedCreate_CollectionView.m
//  ChainDeom-控件创建篇
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TestChainedCreate_CollectionView.h"
#import <ZFC_ChainedCreaterHeader.h>
#import "TestCollectionViewHeaderFooterView.h"


@interface TestChainedCreate_CollectionView()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation TestChainedCreate_CollectionView



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutUI];
    
}


- (void)layoutUI {
    
    //collectionView
    self.collectionView = [UICollectionView ZFC_CollectionViewChainedCreater:^(ZFC_CollectionChainedCreater *creater) {
        creater.layout_minimumLineSpacing(10)
        .layout_minimumInteritemSpacing(15)
        .layout_itemSize(CGSizeMake(100, 100))
        .layout_headerReferenceSize(CGSizeMake(50, 50))
        .layout_footerReferenceSize(CGSizeMake(50, 50))
        .layout_scrollDirection(UICollectionViewScrollDirectionVertical)
        .layout_sectionHeadersPinToVisibleBounds(YES)
        .layout_sectionHeadersPinToVisibleBounds(YES)
        .frame(self.view.bounds)
        .tag(2)
        .backgroundColor([UIColor whiteColor])
        .addIntoView(self.view);
    }];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[TestCollectionViewHeaderFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView registerClass:[TestCollectionViewHeaderFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 8;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
    
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        TestCollectionViewHeaderFooterView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        headerView.myLabel.backgroundColor = [UIColor orangeColor];
        headerView.myLabel.text = @"我是段头";
        return headerView;
        
    }else {
        TestCollectionViewHeaderFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        footerView.myLabel.backgroundColor = [UIColor orangeColor];
        footerView.myLabel.text = @"我是段尾";
        return footerView;
        
    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点击了tableView");
    
}

- (void)dealloc {
    
    NSLog(@"collectionView->控制器释放了");
    
}

@end
