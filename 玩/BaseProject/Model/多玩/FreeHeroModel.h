//
//  FreeHeroModel.h
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface FreeHeroModel : BaseModel
@property (nonatomic, strong) NSArray *free;
@property (nonatomic, strong) NSString *desc;
@end

@interface FreeHeroFreeModel : BaseModel
@property (nonatomic, strong) NSString *enName;
@property (nonatomic, strong) NSString *cnName;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *tags;
@end
