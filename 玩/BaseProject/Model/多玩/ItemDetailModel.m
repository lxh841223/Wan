//
//  ItemDetailModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ItemDetailModel.h"

@implementation ItemDetailModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id",
             @"desc" : @"description"};
}
@end

@implementation ItemDetailExtAttrsModel
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
    return [propertyName mj_firstCharUpper];
}
@end
