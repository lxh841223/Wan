//
//  TuWanVideoViewModel.h
//  BaseProject
//
//  Created by Lxh on 16/11/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanVideoViewModel : BaseViewModel
- (instancetype)initWithAid:(NSString *)aid;
@property (nonatomic, strong) NSString *aid;

/** 底部列表行数 */
@property (nonatomic, assign) NSInteger rowNumber;
/**  */
@property (nonatomic, strong) NSString *videoTitle;
/**  */
@property (nonatomic, strong) TuWanVideoModel *videoModel;
/** 返回底部列表某行数据的题目 */
- (NSString *)titleForRowInRelevant:(NSInteger)row;
/** 返回底部列表某行数据的长题目 */
- (NSString *)descForRowInRelevant:(NSInteger)row;
/** 返回底部列表某行数据的点击数 */
- (NSString *)clicksForRowInRelevant:(NSInteger)row;
/** 返回底部列表某行数据的图片 */
- (NSURL *)iconURLForRowInRelevant:(NSInteger)row;


@end
