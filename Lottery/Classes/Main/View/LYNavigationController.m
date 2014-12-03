//
//  LYNavigationController.m
//  Lottery
//
//  Created by 叶根长 on 14-12-3.
//  Copyright (c) 2014年 叶根长. All rights reserved.
//

#import "LYNavigationController.h"

@interface LYNavigationController ()

@end

@implementation LYNavigationController

#pragma mark IOS通过以下方法设置导航栏字体颜色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    //白色
    return UIStatusBarStyleLightContent;
}

#pragma mark 只运行一次 设置统一样式的导航栏
+(void)initialize
{
    UINavigationBar *navbar=[UINavigationBar appearance];
    UIBarButtonItem *navItem=[UIBarButtonItem appearance];
    
    NSString *navbgimg=nil;
    if(IOS7_OR_LATER)
    {
        navbgimg=@"NavBar64";
        //设置返回按钮的箭头为为白色
        navbar.tintColor=[UIColor whiteColor];
    }
    else
    {
        navbgimg=@"NavBar"; //ios6导航背景图片
        //设置导航栏背景为黑色
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleBlackOpaque;
        //设置导航按钮背景图片
        [navItem setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [navItem setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        //设置返回按钮背景图片
        [navItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [navItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }
    //设置导航栏背景
    [navbar setBackgroundImage:[UIImage imageNamed:navbgimg] forBarMetrics:UIBarMetricsDefault];
    [navbar setTitleTextAttributes:@{UITextAttributeTextColor: [UIColor whiteColor]}];
    [navItem setTitleTextAttributes:@{
          UITextAttributeTextColor: [UIColor whiteColor],
          UITextAttributeFont:kFont(15)
          } forState:UIControlStateNormal];
   
}

@end
