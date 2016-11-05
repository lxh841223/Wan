//
//  XiMaCategoryViewModel.h
//  BaseProject
//
//  Created by Lxh on 16/11/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"

@interface XiMaCategoryViewModel : BaseViewModel
/** 有多少数据 */
@property (nonatomic, assign) NSInteger rowNumber;
/** 某行数据的题目 */
- (NSString *)titleForRow:(NSInteger)row;
/** 某行数据的描述 */
- (NSString *)descForRow:(NSInteger)row;
/** 某行数据的集数 */
- (NSString *)numberForRow:(NSInteger)row;
/** 某行数据的图片地址 */
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 某行数据的对应的id */
- (NSInteger)albumIdForRow:(NSInteger)row;

/** 当前页数 */
@property (nonatomic, assign) NSInteger pageId;
/** 最大页数 */
@property (nonatomic, assign) NSInteger maxPageId;
@end
