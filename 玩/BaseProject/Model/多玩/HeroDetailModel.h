//
//  HeroDetailModel.h
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class HeroDetailBraumModel, HeroDetailHateModel;

@interface HeroDetailModel : BaseModel
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) HeroDetailBraumModel *Braum_W;
@property (nonatomic, strong) NSString *healthLevel;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) HeroDetailBraumModel *Braum_Q;
@property (nonatomic, strong) NSString *quoteAuthor;
@property (nonatomic, strong) NSString *criticalChanceLevel;
@property (nonatomic, strong) NSString *splashPath;
@property (nonatomic, strong) NSString *manaLevel;
@property (nonatomic, strong) NSString *manaRegenBase;
@property (nonatomic, strong) NSArray *hate;
@property (nonatomic, strong) NSString *attackLevel;
@property (nonatomic, strong) NSString *ratingDifficulty;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) HeroDetailBraumModel *Braum_E;
@property (nonatomic, strong) NSString *healthRegenBase;
@property (nonatomic, strong) NSString *magicResistLevel;
@property (nonatomic, strong) NSString *iconPath;
@property (nonatomic, strong) NSString *selectSoundPath;
@property (nonatomic, strong) NSString *healthBase;
@property (nonatomic, strong) NSArray *like;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *manaRegenLevel;
@property (nonatomic, strong) NSString *armorLevel;
@property (nonatomic, strong) NSString *range;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *danceVideoPath;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *attackBase;
@property (nonatomic, strong) NSString *manaBase;
@property (nonatomic, strong) NSString *portraitPath;
@property (nonatomic, strong) NSString *armorBase;
@property (nonatomic, strong) NSString *quote;
@property (nonatomic, strong) NSString *opponentTips;
@property (nonatomic, strong) NSString *criticalChanceBase;
@property (nonatomic, strong) NSString *ratingDefense;
@property (nonatomic, strong) HeroDetailBraumModel *Braum_B;
@property (nonatomic, strong) NSString *tips;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *healthRegenLevel;
@property (nonatomic, strong) NSString *ratingMagic;
@property (nonatomic, strong) HeroDetailBraumModel *Braum_R;
@property (nonatomic, strong) NSString *moveSpeed;
@property (nonatomic, strong) NSString *magicResistBase;
@property (nonatomic, strong) NSString *ratingAttack;
@end

@interface HeroDetailBraumModel : BaseModel
@property (nonatomic, strong) NSString *effect;
@property (nonatomic, strong) NSString *cost;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *cooldown;
@property (nonatomic, strong) NSString *range;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *name;
@end

@interface HeroDetailHateModel : BaseModel
@property (nonatomic, strong) NSString *partner;
@property (nonatomic, strong) NSString *des;
@end



































