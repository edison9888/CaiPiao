//
//  LYTabBar.h
//  Lottery
//
//  Created by 叶根长 on 14-12-3.
//  Copyright (c) 2014年 叶根长. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LYTabBarDelegate <NSObject>

/**
 选项卡按钮被点击
 @param from 点击前Item的索引
 @param to 点击后的Item的索引
 */
-(void)tabBarSelectedFrom:(int)from to:(int)to;

@end

@interface LYTabBar : UIImageView

-(void)CreateBarItems;

/**
 代理
 */
@property(nonatomic,weak) id<LYTabBarDelegate> delegate;

@end
