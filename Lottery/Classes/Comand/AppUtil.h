//
//  AppUtil.h
//  LingHang
//
//  Created by 叶根长 on 14-10-12.
//  Copyright (c) 2014年 叶根长. All rights reserved.
//

#ifndef YGC_AppUtil_h
#define YGC_AppUtil_h

//自定义输出宏 替换NSLog();
#ifdef DEBUG
//调试状态下替换NSLog的功能
#define MyLog(...) NSLog(__VA_ARGS__);
#else
//编译状态下替换成空白,提高性能
#define MyLog(...)
#endif

//判断是否ios系统
#define NLSystemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)
#define IOS7_OR_LATER NLSystemVersionGreaterOrEqualThan(7.0)

//判断是否iphone5尺寸设备
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//主屏幕的bounds
#define UIScreenBounds [[UIScreen mainScreen] bounds]

//主屏幕宽度
#define UIScreen_Width UIScreenBounds.size.width

//主屏幕高度
#define UIScreen_Heigth UIScreenBounds.size.height

//self.frame.size
#define kselfsize self.frame.size
//self.view.frame.size
#define kselfviewsize self.view.frame.size

//应用程序高度
#define kAppHeight [[UIScreen mainScreen] applicationFrame].size.height
//应用程序宽度
#define kAppWidth  [[UIScreen mainScreen] applicationFrame].size.width

//获取沙盒文档路径
#define kDocPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]

//拼接文档路径
#define kAppendDocPath(filename) [kDocPath stringByAppendingPathComponent:filename]

//GB2321编码方式
#define kGBKCoding CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)

//获取RGB颜色
#define kGetColorRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

//创建字体大小
#define kFont(size) [UIFont systemFontOfSize:(size)]

#endif