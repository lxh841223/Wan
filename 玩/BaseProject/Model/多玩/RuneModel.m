//
//  RuneModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RuneModel.h"

@implementation RuneModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"purple" : [RunePurpleModel class],
             @"yellow" : [RunePurpleModel class],
             @"blue" : [RunePurpleModel class],
             @"red" : [RunePurpleModel class]};
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
    return [propertyName mj_firstCharUpper];
}
@end

@implementation RunePurpleModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"img" : @"Img",
             @"name" : @"Name",
             @"recom" : @"Recom",
             @"standby" : @"Standby",
             @"type" : @"Type",
             @"units" : @"Units",
             @"alias" : @"Alias",
             @"prop" : @"Prop"};
}
@end
