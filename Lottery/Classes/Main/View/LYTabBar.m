//
//  LYTabBar.m
//  Lottery
//
//  Created by 叶根长 on 14-12-3.
//  Copyright (c) 2014年 叶根长. All rights reserved.
//

#import "LYTabBar.h"

#pragma mark 自定义选项卡按钮
@interface LYTabBarItem : UIButton

@end

@implementation LYTabBarItem

//取消高亮效果
-(void)setHighlighted:(BOOL)highlighted
{

}

@end



@interface LYTabBar ()
{
    LYTabBarItem *_selectItem;//当前选择的BarItem
}
@end

@implementation LYTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image=[UIImage imageNamed:@"TabBarBack"];
        self.userInteractionEnabled=YES;
    }
    return self;
}

#pragma mark 批量创建TabItem
-(void)CreateBarItems
{
    [self CreateBarItem:@"TabBar1" hlimg:@"TabBar1Sel"];
     [self CreateBarItem:@"TabBar2" hlimg:@"TabBar2Sel"];
     [self CreateBarItem:@"TabBar3" hlimg:@"TabBar3Sel"];
     [self CreateBarItem:@"TabBar4" hlimg:@"TabBar4Sel"];
     [self CreateBarItem:@"TabBar5" hlimg:@"TabBar5Sel"];
}

#pragma mark 创建统一样式的Item
-(void)CreateBarItem:(NSString *)norimg hlimg:(NSString *)hlimg
{
    //子控件的数量
    LYTabBarItem *btn=[LYTabBarItem buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:norimg] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hlimg] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(barItemSelected:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
    [self setBarItemsFrame];
    
    //设置tag
    btn.tag=self.subviews.count-1;
    
    //默认选择第一个
    if(self.subviews.count==1)
        [self barItemSelected:btn];
}

#pragma mark 设置每个TabItem的Frame
-(void)setBarItemsFrame
{
    for (int i=0; i<self.subviews.count; i++) {
        UIView *view=self.subviews[i];
        CGFloat w=kselfsize.width/self.subviews.count;
        CGFloat h=kselfsize.height;
        CGFloat x=w*i;
        CGFloat y=0;
        view.frame=CGRectMake(x, y, w, h);
    }
}

#pragma mark 按钮点击时间
-(void)barItemSelected:(LYTabBarItem *)baritem
{
    //通知代理
    if(_delegate&&[_delegate respondsToSelector:@selector(tabBarSelectedFrom:to:)])
    {
        [_delegate tabBarSelectedFrom:_selectItem.tag to:baritem.tag];
    }
    _selectItem.selected=NO;
    baritem.selected=YES;
    _selectItem=baritem;
}

@end
