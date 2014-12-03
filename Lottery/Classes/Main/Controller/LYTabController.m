//
//  LYTabController.m
//  Lottery
//
//  Created by 叶根长 on 14-12-3.
//  Copyright (c) 2014年 叶根长. All rights reserved.
//

#import "LYTabController.h"
#import "LYTabBar.h"
#import "UINavigationItem+YGCCategory.h"
@interface LYTabController ()<LYTabBarDelegate>
{
    LYTabBar *_lytabbar;
}
@end

@implementation LYTabController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //移除默认的TabBar,创建并添加自定义的bar
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         [self.tabBar removeFromSuperview];
        _lytabbar=[[LYTabBar alloc]initWithFrame:self.tabBar.frame];
        _lytabbar.delegate=self;
        [_lytabbar CreateBarItems];
        [self.view addSubview:_lytabbar];
    });
   
}

#pragma mark LYTabBar代理方法
-(void)tabBarSelectedFrom:(int)from to:(int)to
{
    [self setSelectedIndex:to];
    
    //将新控制器的导航栏目赋值到当前的导航栏目
    UIViewController *newViewController=self.childViewControllers[to];
    [self.navigationItem copyNavigationItemTo:newViewController.navigationItem];
}


@end
