//
//  UINavigationItem+YGC.m
//  Lottery
//
//  Created by 叶根长 on 14-12-3.
//  Copyright (c) 2014年 叶根长. All rights reserved.
//

#import "UINavigationItem+YGCCategory.h"

@implementation UINavigationItem (YGCCategory)

-(void)copyNavigationItemTo:(UINavigationItem *)navigationitem
{
    self.leftBarButtonItem=navigationitem.leftBarButtonItem;
    self.leftBarButtonItems=navigationitem.leftBarButtonItems;
    self.rightBarButtonItem=navigationitem.rightBarButtonItem;
    self.rightBarButtonItems=navigationitem.rightBarButtonItems;
    self.title=navigationitem.title;
    self.titleView=navigationitem.titleView;
}

@end
