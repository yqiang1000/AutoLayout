//
//  ViewController.m
//  AutoLayout
//
//  Created by WeibaYeQiang on 16/8/10.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //subView
    UIView *sb = [[UIView alloc] init];
    [self.view addSubview:sb];
    sb.backgroundColor = [UIColor blackColor];
    [sb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    //scrollview
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [sb addSubview:scrollView];
    
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        //设置大小以及边框宽度
        make.edges.mas_equalTo(sb).width.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    //scrollView 中的
    UIView *container = [[UIView alloc] init];
    [scrollView addSubview:container];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(scrollView);
        make.width.mas_equalTo(scrollView);
    }];
    
    int count = 10;
    UIView *lastView = nil;
    for (int i = 0; i < count; i++) {
        UIView *subV = [UIView new];
        [container addSubview:subV];
        subV.backgroundColor = [UIColor colorWithHue:(arc4random()%255/255.0) saturation:(arc4random()%255/255.0) brightness:(arc4random()%255/255.0) alpha:1];
        
        [subV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            } else {
                make.top.mas_equalTo(container.mas_top);
            }
            
        }];
        
        lastView = subV;
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(lastView.mas_bottom);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
