//
//  TuWanListCell.h
//  BaseProject
//
//  Created by Lxh on 16/10/31.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanListCell : UITableViewCell
/** 题目标签 */
@property (nonatomic, strong) UILabel *titleLb;
/** 详情标签 */
@property (nonatomic, strong) UILabel *descLb;
/** 左侧图片 */
@property (nonatomic, strong) UIImageView *iconIV;
/** 点击数标签 */
@property (nonatomic, strong) UILabel *clicksNumLb;
@end
