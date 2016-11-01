//
//  TuWanViewController.h
//  BaseProject
//
//  Created by Lxh on 16/10/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WMPageController.h>

@interface TuWanViewController : WMPageController

//内容页的首页应该是单例的，每次进程都只初始化一次
+ (UINavigationController *)standardTuWanNavi;

@end
