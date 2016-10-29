//
//  HeroWeekDataModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroWeekDataModel.h"

@implementation HeroWeekDataModel

@end

@implementation HeroWeekDataDataModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"charts" : [HeroWeekDataDataChartsModel class]};
}

+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
    return [propertyName mj_underlineFromCamel];
}
@end

@implementation HeroWeekDataDataChartsModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"ratioData" : [HeroWeekDataDataChartsRatioDataModel class]};
}

+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
    return [propertyName mj_underlineFromCamel];
}
@end

@implementation HeroWeekDataDataChartsRatioDataModel

@end
