//
//  HeroWeekDataModel.h
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class HeroWeekDataDataModel, HeroWeekDataDataChartsModel, HeroWeekDataDataChartsRatioDataModel;

@interface HeroWeekDataModel : BaseModel
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) HeroWeekDataDataModel *data;
@property (nonatomic, assign) double code;
@end

@interface HeroWeekDataDataModel : BaseModel
@property (nonatomic, strong) NSArray *charts;
@property (nonatomic, assign) double averageWinRatio;
@property (nonatomic, assign) double averageKNum;
@property (nonatomic, assign) double championId;
@property (nonatomic, assign) double averageDNum;
@property (nonatomic, assign) double averageANum;
@property (nonatomic, assign) double rank;
@end

@interface HeroWeekDataDataChartsModel : BaseModel
@property (nonatomic, strong) NSString *yAxisTitle;
@property (nonatomic, strong) NSArray *ratioData;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *color;
@end

@interface HeroWeekDataDataChartsRatioDataModel : BaseModel
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double value;
@end
