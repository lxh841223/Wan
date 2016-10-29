//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    RESideMenu *sideMenu = [[RESideMenu alloc]initWithContentViewController:[TuWanViewController new] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
    self.window.rootViewController = sideMenu;
    return YES;
}

//生成放有兔玩游戏界面的导航控制器
//- (UINavigationController *)tuwanNavi {
//    
//}

@end















