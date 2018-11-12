//
//  TestChainedCreate_OtherView.m
//  ChainDeom-控件创建篇
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TestChainedCreate_OtherView.h"
#import <ZFC_ChainedCreaterHeader.h>


static inline CGFloat getCenterX(CGFloat width) {
    return ([UIScreen mainScreen].bounds.size.width/2 - width/2);
}

@interface TestChainedCreate_OtherView ()

@end

@implementation TestChainedCreate_OtherView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self layoutUI];
    
}



- (void)layoutUI {
    
    //view
    UIView *chainedView = [UIView ZFC_ViewChainedCreater:^(ZFC_ViewChainedCreater *creater) {
        creater.backgroundColor([UIColor cyanColor])
        .frame(CGRectMake(getCenterX(100), 100, 100, 40))
        .tag(1)
        .isUserTapTapGesture(YES)
        .addIntoView(self.view)
        .layerCornerRadius(5)
        .tapBlock(^(UIView *view) {
            NSLog(@"-------点击了view--------");
        });
    }];
    
    
    //label
    UILabel *label = [UILabel ZFC_LabelChainedCreater:^(ZFC_LabelChainedCreater *creater) {
        
        creater.backgroundColor([UIColor cyanColor])
        .frame(CGRectMake(getCenterX(100), CGRectGetMaxY(chainedView.frame) + 20, 100, 40))
        .tag(2)
        .text(@"我是文字")
        .textColor([UIColor blackColor])
        .font([UIFont systemFontOfSize:15])
        .textAlignment(NSTextAlignmentCenter)
        .numberOfLines(1)
        .addIntoView(self.view)
        .layerCornerRadius(5)
        .tapBlock(^(UILabel *label) {
            NSLog(@"-------点击了label--------");
        });
    }];
    
    
    //imageView
    UIImageView *imageView = [UIImageView ZFC_ImageViewChainedCreater:^(ZFC_ImageViewChainedCreater *creater) {
        creater.backgroundColor([UIColor cyanColor])
        .frame(CGRectMake(getCenterX(100), CGRectGetMaxY(label.frame) + 20, 100, 40))
        .tag(2)
        .image([UIImage imageNamed:@"test.jpg"])
        .layerCornerRadius(5)
        .addIntoView(self.view)
        .tapBlock(^(UIImageView *imageView) {
             NSLog(@"-------点击了imageView--------");
        });

    }];
    
    
    //button
    UIButton *button = [UIButton ZFC_ButtonChainedCreater:^(ZFC_ButtonChainedCreater *creater) {
        creater.backgroundColor([UIColor cyanColor])
        .tag(3)
        .frame(CGRectMake(getCenterX(100), CGRectGetMaxY(imageView.frame) + 20, 100, 40))
        .titleLabelFont([UIFont systemFontOfSize:15])
        .title(@"未选中按钮", UIControlStateNormal)
        .title(@"未选中按钮", UIControlStateSelected)
        .titleColor([UIColor lightGrayColor], UIControlStateNormal)
        .titleColor([UIColor redColor], UIControlStateSelected)
        .layerCornerRadius(5)
        .layerBorderWidthAndBorderColor(1, [UIColor blueColor])
        .addIntoView(self.view)
        .actionBlock(^(UIButton *button) {
            button.selected = !button.selected;
            NSLog(@"-------点击了button--------");
        });
    }];
    
    
    //textField
    UITextField *textField = [UITextField ZFC_TextFieldChainedCreater:^(ZFC_TextFieldChainedCreater *creater) {
        creater.backgroundColor([UIColor cyanColor])
        .tag(4)
         .frame(CGRectMake(getCenterX(100), CGRectGetMaxY(button.frame) + 20, 200, 40))
        .placeholder(@"请输入文字...")
        .font([UIFont systemFontOfSize:15])
        .keyboardType(UIKeyboardTypeDefault)
        .clearButtonMode(YES)
        .layerBorderWidthAndBorderColor(1, [UIColor blackColor])
        .layerCornerRadius(5)
        .addIntoView(self.view);
    }];
    

    
    
    //textView
   [UITextView ZFC_TextViewChainedCreater:^(ZFC_TextViewChainedCreater *creater) {
        creater.backgroundColor([UIColor cyanColor])
        .tag(5)
        .placeholder(@"请输入文字...")
        .font([UIFont systemFontOfSize:15])
        .layerBorderWidthAndBorderColor(1,  [UIColor blackColor])
        .frame(CGRectMake(getCenterX(100), CGRectGetMaxY(textField.frame) + 20, 200, 100))
        .addIntoView(self.view);
    }];
    
}


- (void)dealloc {
    
    NSLog(@"otherView->控制器释放了");
    
}


@end
