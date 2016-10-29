//
//  XiMaNetManager.h
//  BaseProject
//
//  Created by Lxh on 16/10/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "RankingListModel.h"
#import "AlbumModel.h"

@interface XiMaNetManager : BaseNetManager

/**
 获取音乐分类列表

 @param pageId 当前页数，起始页数从1开始。 eg:1,2,3,4...

 @return 返回网络请求任务
 */
+ (id)getRankListWithPageId:(NSInteger)pageId kCompletionHandle;

/**
 获取某音乐分类内容

 @param ID     某音乐的id
 @param pageId 当前页数，起始页数从1开始。 eg:1,2,3,4,5...

 @return 返回网络请求任务
 */
+ (id)getAlbumWithId:(NSInteger)ID pageId:(NSInteger)pageId kCompletionHandle;
@end
