//
//  FreeHeroModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FreeHeroModel.h"

@implementation FreeHeroModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"free" : [FreeHeroFreeModel class]};
}
@end

@implementation FreeHeroFreeModel

@end
