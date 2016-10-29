//
//  HeroChangeModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroChangeModel.h"

@implementation HeroChangeModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"changeLog" : [HeroChangeChangeLogModel class]};
}
@end

@implementation HeroChangeChangeLogModel

@end
