//
//  TuWanModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanModel.h"

@implementation TuWanModel

@end

@implementation TuWanDataModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"indexpic" : [TuWanDataIndexpicModel class],
             @"list" :  [TuWanDataIndexpicModel class]};
}
@end

@implementation TuWanDataIndexpicModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"showitem" : [TuWanDataIndexpicShowitemModel class]};
}
@end

@implementation TuWanDataIndexpicInfochildModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"typeName" : @"typename",
             @"desc" : @"description"};
}
@end

@implementation TuWanDataIndexpicShowitemModel

@end

@implementation TuWanDataIndexpicShowitemInfoModel

@end
