//
//  HeroDetailModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroDetailModel.h"

@implementation HeroDetailModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"hate" : [HeroDetailHateModel class],
             @"like" : [HeroDetailHateModel class]};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id",
             @"desc" : @"description"};
}
@end

@implementation HeroDetailBraumModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id",
             @"desc" : @"description"};
}
@end

@implementation HeroDetailHateModel

@end
