//
//  TuWanImageCell.h
//  BaseProject
//
//  Created by Lxh on 16/10/31.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanImageCell : UITableViewCell
/** 题目标签 */
@property (nonatomic, strong) UILabel *titleLb;
/** 点击数标签 */
@property (nonatomic, strong) UILabel *clickNumLb;
/** 左侧图片 */
@property (nonatomic, strong) UIImageView *iconIV0;
/** 中间图片 */
@property (nonatomic, strong) UIImageView *iconIV1;
/** 右侧图片 */
@property (nonatomic, strong) UIImageView *iconIV2;
@end
