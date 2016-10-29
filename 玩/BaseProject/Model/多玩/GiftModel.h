//
//  GiftModel.h
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface GiftModel : BaseModel
@property (nonatomic, strong) NSArray *a;
@property (nonatomic, strong) NSArray *d;
@property (nonatomic, strong) NSArray *g;
@end

@interface GiftAModel : BaseModel
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSArray *level;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *need;
@end
