//
//  TuWanVideoViewController.h
//  BaseProject
//
//  Created by Lxh on 16/11/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanVideoViewController : UITableViewController
- (instancetype)initWithAid:(NSString *)aid;
@property (nonatomic, strong) NSString *aid;
@end
