//
//  HeroVideoModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroVideoModel.h"

@implementation HeroVideoModel
+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"channelId"] || [propertyName isEqualToString:@"totalPage"]) {
        return propertyName;
    }
    return [propertyName mj_underlineFromCamel];
}
//+ (NSDictionary *)mj_replacedKeyFromPropertyName {
//    return @{@"coverUrl" : @"cover_url",
//             @"letvVideoId" : @"letv_video_id",
//             @"letvVideoUnique" : @"letv_video_unique",
//             @"playCount" : @"play_count",
//             @"uploadTime" : @"upload_time",
//             @"videoLength" : @"video_length"};
//}
@end
