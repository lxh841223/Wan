//
//  RankingListModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RankingListModel.h"

@implementation RankingListModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list" : [RankingListListModel class]};
}
@end

@implementation RankingListListModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}
@end
