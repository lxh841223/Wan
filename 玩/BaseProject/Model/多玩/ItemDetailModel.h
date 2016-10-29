//
//  ItemDetailModel.h
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ItemDetailExtAttrsModel;

@interface ItemDetailModel : BaseModel
@property (nonatomic, strong) ItemDetailExtAttrsModel *extAttrs;
@property (nonatomic, strong) NSString *need;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, assign) double allPrice;
@property (nonatomic, assign) double sellPrice;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *compose;
@property (nonatomic, strong) NSString *extDesc;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tags;
@end

@interface ItemDetailExtAttrsModel : BaseModel
@property (nonatomic, assign) double flatMPPoolMod;
@property (nonatomic, assign) double flatPhysicalDamageMod;
@end
