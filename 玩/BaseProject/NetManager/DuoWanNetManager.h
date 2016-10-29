//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by Lxh on 16/10/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuoWanModel.h"

typedef NS_ENUM(NSUInteger, HeroType) {
    HeroTypeFree,   //免费英雄
    HeroTypeAll,    //全部英雄
};
@interface DuoWanNetManager : BaseNetManager

/**
 获取免费英雄或全部英雄列表

 @param type 请求英雄列表类型

 @return 返回网络请求任务
 */
+ (id)getHeroWithType:(HeroType)type kCompletionHandle;

/**
 获取英雄皮肤

 @param heroName 获取皮肤的英雄英文名称

 @return 返回网络请求任务
 */
+ (id)getHeroSkinWithHeroName:(NSString *)heroName kCompletionHandle;

/**
 获取英雄配音

 @param heroName 英雄英文名称

 @return 返回网络请求任务
 */
+ (id)getHeroSoundWithHeroName:(NSString *)heroName kCompletionHandle;

/**
 获取英雄视频

 @param page 当前列表页数，起始页从1开始。 eg:1,2,3,4,5...
 @param enName 英雄英文名称

 @return 返回网络请求途任务
 */
+ (id)getHeroVideoWithPage:(NSInteger)page tag:(NSString *)enName kCompletionHandle;

/**
 获取英雄出装

 @param enName 英雄英文名称

 @return 返回网络请求任务
 */
+ (id)getHeroCZWithChampionName:(NSString *)enName kCompletionHandle;

/**
 获取英雄资料

 @param enName 英雄英文名称

 @return 返回网络请求任务
 */
+ (id)getHeroDetailWithHeroName:(NSString *)enName kCompletionHandle;

/**
 获取天赋符文

 @param enName 英雄英文名称

 @return 返回网络请求任务
 */
+ (id)getGiftAndRunWithHeroName:(NSString *)enName kCompletionHandle;

/**
 获取英雄改动信息

 @param enName 英雄英文名称

 @return 返回网络请求任务
 */
+ (id)getHeroInfoWithNameName:(NSString *)enName kCompletionHandle;

/**
 获取一周数据

 @param heroId 英雄id

 @return 返回网络请求任务
 */
+ (id)getWeekDataWithHeroId:(NSInteger)heroId kCompletionHandle;

/**
 获取百科列表

 @return 返回网络请求任务
 */
+ (id)getToolMenuCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/**
 获取装备分类
 
 @return 返回网络请求任务
 */
+ (id)getZBCategoryCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/**
 获取某分类装备列表

 @param tag 装备类型

 @return 返回网络请求任务
 */
+ (id)getZBItemListWithTag:(NSString *)tag kCompletionHandle;

/**
 获取装备详情

 @param itemId 装备id

 @return 返回网络请求任务
 */
+ (id)getItemDetailWithItemId:(NSInteger)itemId kCompletionHandle;

/**
 获取天赋树

 @return 返回网络请求任务
 */
+ (id)getGiftsCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/**
 获取符文列表
 
 @return 返回网络请求任务
 */
+ (id)getRunesCompletionHandle:(void(^)(id model, NSError *error))completionHandle;
/**
 获取召唤师技能列表
 
 @return 返回网络请求任务
 */
+ (id)getSumAbilityCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/**
 获取最佳阵容
 
 @return 返回网络请求任务
 */
+ (id)getBestGroupCompletionHandle:(void(^)(id model, NSError *error))completionHandle;
@end


























