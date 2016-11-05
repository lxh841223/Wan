//
//  XiMaNetManager.m
//  BaseProject
//
//  Created by Lxh on 16/10/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiMaNetManager.h"

#define kRankListPath   @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album"
#define kAlbumPath      @"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/%@/20"

@implementation XiMaNetManager
+ (id)getRankListWithPageId:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kRankListPath parameters:@{@"device" : @"iPhone", @"key" : @"ranking:album:played:1:2", @"pageId" : @(pageId), @"pageSize" : @20, @"position" : @0, @"title" : @"排行榜"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RankingListModel mj_objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getAlbumWithId:(NSInteger)ID pageId:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle {
    NSString *path = [NSString stringWithFormat:kAlbumPath, @(ID), @(pageId)];
    return [self GET:path parameters:@{@"device" : @"iPhone"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AlbumModel mj_objectWithKeyValues:responseObj], error);
    }];
}
@end
