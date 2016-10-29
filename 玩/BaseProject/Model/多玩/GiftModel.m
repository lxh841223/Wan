//
//  GiftModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "GiftModel.h"

@implementation GiftModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"a" : [GiftAModel class],
             @"d" : [GiftAModel class],
             @"g" : [GiftAModel class]};
}
@end

@implementation GiftAModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}
@end
