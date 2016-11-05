//
//  XiMaAlbumViewModel.m
//  BaseProject
//
//  Created by Lxh on 16/11/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiMaAlbumViewModel.h"

@implementation XiMaAlbumViewModel
- (BOOL)isHasMore {
    return _maxPageId > _pageId;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle {
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle {
    if (self.isHasMore) {
        _pageId += 1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }else{
        NSError *err = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey : @"没有更多数据了"}];
        completionHandle(err);
    }
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    self.dataTask = [XiMaNetManager getAlbumWithId:_albumId pageId:_pageId completionHandle:^(AlbumModel * model, NSError *error) {
        if (!error) {
            if (_pageId == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.tracks.list];
            _maxPageId = model.tracks.maxPageId;
        }
        completionHandle(error);
    }];
}

- (AlbumTracksListModel *)listModelForRow:(NSInteger)row {
    return self.dataArr[row];
}

- (NSInteger)rowNumber {
    return self.dataArr.count;
}

/** 是否有更多页 */
/** 获取某行的图片url */
- (NSURL *)coverURLForRow:(NSInteger)row {
    return [NSURL URLWithString:[self listModelForRow:row].coverSmall];
}
/** 获取某行的标题 */
- (NSString *)titleForRow:(NSInteger)row {
    return [self listModelForRow:row].title;
}
/** 获取某行的更新时间 */
- (NSString *)timeForRow:(NSInteger)row {
//  1477147187000   创建时间，距离1970年的秒数
//  获取当前距离1970年的秒数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
//  算出创建到现在的秒数
    NSTimeInterval delta = currentTime - [self listModelForRow:row].createdAt / 1000;
//  秒数转小时
    NSInteger hours = delta / 3600;
    if (hours < 24) {
        return [NSString stringWithFormat:@"%ld小时前", hours];
    }
//  秒数转天数
    NSInteger days = delta / 3600 / 24;
    return [NSString stringWithFormat:@"%ld天前", days];
}
/** 获取某行的出处 */
- (NSString *)sourceForRow:(NSInteger)row {
    return [@"by " stringByAppendingString:[self listModelForRow:row].nickname];
}
/** 获取某行的播放次数 */
- (NSString *)playCountForRow:(NSInteger)row {
    NSInteger count = [self listModelForRow:row].playtimes;
    if (count < 10000) {
        return @([self listModelForRow:row].playtimes).stringValue;
    }else{
        return [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    }
}
/** 获取某行的喜爱数 */
- (NSString *)likesForRow:(NSInteger)row {
    return @([self listModelForRow:row].likes).stringValue;
}
/** 获取某行的评论数 */
- (NSString *)commentsForRow:(NSInteger)row {
    return @([self listModelForRow:row].comments).stringValue;
}
/** 获取某行的播放时长 */
- (NSString *)durationForRow:(NSInteger)row {
    NSInteger duration = [self listModelForRow:row].duration;
    NSInteger minute = duration / 60;
    NSInteger second = duration % 60;
    return [NSString stringWithFormat:@"%02ld:%02ld", minute, second];
}
///** 获取某行的下载地址 */
//- (NSURL *)downLoadURLForRow:(NSInteger)row {
//    
//}
/** 获取某行音频的播放地址 */
- (NSURL *)musicURLForRow:(NSInteger)row {
    return [NSURL URLWithString:[self listModelForRow:row].playUrl64];;
}
@end



















