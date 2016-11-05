//
//  XiMaCategoryCell.h
//  BaseProject
//
//  Created by Lxh on 16/11/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XiMaCategoryCell : UITableViewCell
/** 类型标题 */
@property (nonatomic, strong) UILabel *titleLb;
/** 类型描述 */
@property (nonatomic, strong) UILabel *descLb;
/** 类型集数 */
@property (nonatomic, strong) UILabel *numberLb;
/** 序号标签 */
@property (nonatomic, strong) UILabel *orderLb;
/** 类型图片 */
@property (nonatomic, strong) UIImageView *iconIV;
/** 集数图标 */
@property (nonatomic, strong) UIImageView *numberIV;
@end
