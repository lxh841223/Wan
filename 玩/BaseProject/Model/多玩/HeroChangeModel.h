//
//  HeroChangeModel.h
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface HeroChangeModel : BaseModel
@property (nonatomic, strong) NSString *gold;
@property (nonatomic, strong) NSString *coupon;
@property (nonatomic, strong) NSArray *changeLog;
@property (nonatomic, strong) NSString *eName;
@property (nonatomic, strong) NSString *cName;
@property (nonatomic, strong) NSString *location;
@end

@interface HeroChangeChangeLogModel : BaseModel
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *info;
@end
