//
//  TuWanPicModel.m
//  BaseProject
//
//  Created by Lxh on 16/11/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanPicModel.h"

@implementation TuWanPicModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"showitem" : [TuWanPicContentModel class],
             @"relevant" : [TuWanPicRelevantModel class],
             @"content" : [TuWanPicContentModel class]};
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"typeName" : @"typename",
             @"desc" : @"description"};
}
@end

@implementation TuWanPicInfochildModel

@end

@implementation TuWanPicRelevantModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"typeName" : @"typename",
             @"desc" : @"description"};
}
@end

@implementation TuWanPicContentModel

@end

@implementation TuWanPicContentInfoModel

@end
