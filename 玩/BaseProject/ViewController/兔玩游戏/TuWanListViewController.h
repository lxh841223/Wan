//
//  TuWanListViewController.h
//  BaseProject
//
//  Created by Lxh on 16/10/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanListViewController : UITableViewController
/** 接收外部传参，决定当前控制器显示哪种类型的信息 */
@property (nonatomic, assign) NSNumber *infoType;
@end
