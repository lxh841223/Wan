//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by Lxh on 16/10/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
#import "DuoWanRequestPath.h"

#define kOSType         @"OSType" : [@"iOS" stringByAppendingString:\
                            [UIDevice currentDevice].systemVersion]
#define kV              @"v" : @"140"
#define kVersionName    @"versionName" : @"2.4.0"

#define kChangeKey(key) [dic setObject:[dic objectForKey:[enName stringByAppendingString:key]]\
                        forKey:[@"desc" stringByAppendingString:key]];\
                        [dic removeObjectForKey:[enName stringByAppendingString:key]];

@implementation DuoWanNetManager
+ (id)getHeroWithType:(HeroType)type completionHandle:(void (^)(id, NSError *))completionHandle {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kV, kOSType}];
    switch (type) {
        case HeroTypeFree:
            [params setObject:@"free" forKey:@"type"];
            break;
        case HeroTypeAll:
            [params setObject:@"all" forKey:@"type"];
            break;
        default:
            NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
    }
    return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        switch (type) {
            case HeroTypeFree:
                completionHandle([FreeHeroModel mj_objectWithKeyValues:responseObj], error);
                break;
            case HeroTypeAll:
                completionHandle([AllHeroModel mj_objectWithKeyValues:responseObj], error);
                break;
            default:
                completionHandle(nil, error);
                break;
        }
    }];
}

+ (id)getHeroSkinWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kHeroSkinPath parameters:@{kV, kOSType, kVersionName, @"hero" : heroName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroSkinModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroSoundWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kHeroSoundPath parameters:@{kV, kOSType, kVersionName, @"hero" : heroName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle(responseObj, error);
    }];
}

+ (id)getHeroVideoWithPage:(NSInteger)page tag:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kHeroVideoPath parameters:@{kV, kOSType, @"action" : @"l", @"p" : @(page), @"tag" : enName, @"src" : @"letv"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroVideoModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroCZWithChampionName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kHeroCZPath parameters:@{kV, kOSType, @"championName" : enName, @"limit" : @7} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroCZModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroDetailWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kHeroDetailPath parameters:@{kV, kOSType, @"heroName" : enName} completionHandler:^(id responseObj, NSError *error) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:responseObj];
        kChangeKey(@"_B")
        kChangeKey(@"_E")
        kChangeKey(@"_Q")
        kChangeKey(@"_R")
        kChangeKey(@"_W")
        completionHandle([HeroDetailModel mj_objectWithKeyValues:dic], error);
    }];
}

+ (id)getGiftAndRunWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kGiftAndRunPath parameters:@{kV, kOSType, @"hero" : enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroGiftModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroInfoWithNameName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kHeroInfoPath parameters:@{kV, kOSType, @"name" : enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroChangeModel mj_objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getWeekDataWithHeroId:(NSInteger)heroId completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kWeekDataPath parameters:@{@"heroId" : @(heroId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroWeekDataModel mj_objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getToolMenuCompletionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kToolMenuPath parameters:@{kV, kOSType, kVersionName, @"category" : @"database"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ToolMenuModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getZBCategoryCompletionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kZBCategoryPath parameters:@{kV, kOSType, kVersionName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBCategoryModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getZBItemListWithTag:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kZBItemListPath parameters:@{kV, kOSType, kVersionName, @"tag" : tag} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBItemModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getItemDetailWithItemId:(NSInteger)itemId completionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kItemDetailPath parameters:@{kV, kOSType, @"id" : @(itemId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ItemDetailModel mj_objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getGiftsCompletionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kGiftPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GiftModel mj_objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getRunesCompletionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kRunesPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RuneModel mj_objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getSumAbilityCompletionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kSumAbilityPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([SumAbilityModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getBestGroupCompletionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kBestGroupPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BestGroupModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}
@end


















