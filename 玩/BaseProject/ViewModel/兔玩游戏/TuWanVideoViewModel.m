//
//  TuWanVideoViewModel.m
//  BaseProject
//
//  Created by Lxh on 16/11/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanVideoViewModel.h"

@implementation TuWanVideoViewModel
- (instancetype)initWithAid:(NSString *)aid {
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        NSAssert1(NO, @"%s:必须使用initWithAid初始化", __func__);
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    self.dataTask = [TuWanNetManager getVideoDetailWithId:_aid completionHandle:^(TuWanVideoModel *model, NSError *error) {
        self.videoModel = model;
        completionHandle(error);
    }];
}

- (NSInteger)rowNumber {
    return self.videoModel.relevant.count;
}

- (NSString *)videoTitle {
    return self.videoModel.title;
}

- (TuWanVideoRelevantModel *)relevantModelForRow:(NSInteger)row {
    return self.videoModel.relevant[row];
}
/** 返回底部列表某行数据的题目 */
- (NSString *)titleForRowInRelevant:(NSInteger)row {
    return [self relevantModelForRow:row].title;
}
/** 返回底部列表某行数据的长题目 */
- (NSString *)descForRowInRelevant:(NSInteger)row {
    return [self relevantModelForRow:row].desc;
}
/** 返回底部列表某行数据的点击数 */
- (NSString *)clicksForRowInRelevant:(NSInteger)row {
    return [[self relevantModelForRow:row].click stringByAppendingString:@"人浏览"];
}
/** 返回底部列表某行数据的图片 */
- (NSURL *)iconURLForRowInRelevant:(NSInteger)row {
    return [NSURL URLWithString:[self relevantModelForRow:row].litpic];
}
@end





























