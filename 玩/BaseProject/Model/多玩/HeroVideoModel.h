//
//  HeroVideoModel.h
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface HeroVideoModel : BaseModel
@property (nonatomic, strong) NSString *channelId;
@property (nonatomic, assign) double totalPage;
@property (nonatomic, strong) NSString *coverUrl;
@property (nonatomic, strong) NSString *vid;
@property (nonatomic, strong) NSString *letvVideoUnique;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *udb;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *letvVideoId;
@property (nonatomic, assign) double videoLength;
@property (nonatomic, strong) NSString *playCount;
@property (nonatomic, strong) NSString *uploadTime;
@end
