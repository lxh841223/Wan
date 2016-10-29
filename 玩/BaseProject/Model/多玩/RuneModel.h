//
//  RuneModel.h
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface RuneModel : BaseModel
@property (nonatomic, strong) NSArray *purple;
@property (nonatomic, strong) NSArray *yellow;
@property (nonatomic, strong) NSArray *blue;
@property (nonatomic, strong) NSArray *red;
@end

@interface RunePurpleModel : BaseModel
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double recom;
@property (nonatomic, strong) NSString *lev3;
@property (nonatomic, strong) NSString *lev2;
@property (nonatomic, assign) double iplev3;
@property (nonatomic, strong) NSString *standby;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *units;
@property (nonatomic, strong) NSString *lev1;
@property (nonatomic, assign) double iplev2;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *prop;
@property (nonatomic, assign) double iplev1;
@end
