//
//  TuWanNetManager.m
//  BaseProject
//
//  Created by Lxh on 16/10/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"

#define kTuWanPath  @"http://cache.tuwan.com/app/"
#define kAppId      @"appid" : @"1"
#define kClassMore  @"classmore" : @"indexpic"
#define kAppVer     @"appver" : @"2.1"

#define kRemoveClassMore(dic)   [dic removeObjectForKey:@"classmore"];
#define kSetClass(string, dic)  [dic setObject:string forKey:@"class"];
#define kSetMod(string, dic)    [dic setObject:string forKey:@"mod"];
#define kSetDtId(string, dic)   [dic setObject:string forKey:@"dtid"];

@implementation TuWanNetManager
+ (id)getTuWanWithType:(InfoType)type start:(NSInteger)start completionHandle:(void (^)(id, NSError *))completionHandle {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kAppId, kClassMore,kAppVer, @"start" : @(start)}];
    switch (type) {
        case InfoTypeTouTiao:
            break;
        case InfoTypeDuJia:
            kRemoveClassMore(params)
            kSetClass(@"heronews", params)
            kSetMod(@"八卦", params)
            break;
        case InfoTypeAnHei3:
            kSetDtId(@"83623", params)
            break;
        case InfoTypeMoShou:
            kSetDtId(@"31537", params)
            break;
        case InfoTypeFengBao:
            kSetDtId(@"31538", params)
            break;
        case InfoTypeLuShi:
            kSetDtId(@"31528", params)
            break;
        case InfoTypeXingJi2:
            kRemoveClassMore(params)
            kSetDtId(@"91821", params)
            break;
        case InfoTypeShouWang:
            kRemoveClassMore(params)
            kSetDtId(@"57067", params)
            break;
        case InfoTypeTuPian:
        case InfoTypeShiPin:
        case InfoTypeGongLue:
            kRemoveClassMore(params)
            kSetDtId(@"83623,31528,31537,31538,57067,91821", params)
            if (type == InfoTypeTuPian) [params setObject:@"pic" forKey:@"type"];
            if (type == InfoTypeShiPin) [params setObject:@"video" forKey:@"type"];
            if (type == InfoTypeGongLue) [params setObject:@"guide" forKey:@"type"];
            break;
        case InfoTypeWanHua:
            kRemoveClassMore(params)
            kSetClass(@"heronews", params)
            kSetMod(@"幻化", params)
            break;
        case InfoTypeQuWen:
            kSetDtId(@"0", params)
            kSetClass(@"heronews", params)
            kSetMod(@"趣闻", params)
            break;
        case InfoTypeCos:
            kSetClass(@"cos", params)
            kSetMod(@"cos", params)
            kSetDtId(@"0", params)
            break;
        case InfoTypeMeiNv:
            kSetClass(@"heronews", params)
            kSetMod(@"美女", params)
            [params setObject:@"cos1" forKey:@"typechild"];
            break;
        default:
            NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
    }
    return [self GET:kTuWanPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanModel mj_objectWithKeyValues:responseObj], error);
    }];
}
@end

























