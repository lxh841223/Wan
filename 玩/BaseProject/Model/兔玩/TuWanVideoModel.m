//
//  TuWanVideoModel.m
//  BaseProject
//
//  Created by Lxh on 16/11/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanVideoModel.h"

@implementation TuWanVideoModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"relevant" : [TuWanVideoRelevantModel class],
             @"content" : [TuWanVideoContentModel class]};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"typeName" : @"typename",
             @"desc" : @"description"};
}
@end

@implementation TuWanVideoRelevantModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"typeName" : @"typename",
             @"desc" : @"description"};
}
@end

@implementation TuWanVideoContentModel

@end
