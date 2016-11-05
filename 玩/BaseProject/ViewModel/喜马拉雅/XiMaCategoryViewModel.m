//
//  XiMaCategoryViewModel.m
//  BaseProject
//
//  Created by Lxh on 16/11/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiMaCategoryViewModel.h"

@implementation XiMaCategoryViewModel
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle {
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle {
    if (_maxPageId <= _pageId) {
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey : @"没有更多数据了"}];
        completionHandle(error);
        return;
    }
    _pageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    self.dataTask = [XiMaNetManager getRankListWithPageId:_pageId completionHandle:^(RankingListModel *model, NSError *error) {
        if (!error) {
            if (_pageId == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.list];
            _maxPageId = 5;

        }
        completionHandle(error);
    }];
}

- (NSInteger)rowNumber {
    return self.dataArr.count;
}

- (RankingListListModel *)listModelForRow:(NSInteger)row {
    return self.dataArr[row];
}

/** 某行数据的题目 */
- (NSString *)titleForRow:(NSInteger)row {
    return [self listModelForRow:row].title;
}
/** 某行数据的描述 */
- (NSString *)descForRow:(NSInteger)row {
    return [self listModelForRow:row].intro;
}
/** 某行数据的集数 */
- (NSString *)numberForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%.0f集", [self listModelForRow:row].tracksCounts];
}
/** 某行数据的图片地址 */
- (NSURL *)iconURLForRow:(NSInteger)row {
    return [NSURL URLWithString:[self listModelForRow:row].coverSmall];
}
/** 某行数据的对应的id */
- (NSInteger)albumIdForRow:(NSInteger)row {
    return [self listModelForRow:row].albumId;
}
@end


















