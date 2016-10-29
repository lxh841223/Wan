//
//  RankingListModel.h
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"



@interface RankingListModel : BaseModel
@property (nonatomic, assign) double pageSize;
@property (nonatomic, assign) double pageId;
@property (nonatomic, assign) double totalCount;
@property (nonatomic, assign) double maxPageId;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, assign) double ret;
@end

@interface RankingListListModel : BaseModel
@property (nonatomic, assign) double ID;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, assign) double tracks;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double tracksCounts;
@property (nonatomic, assign) double playsCounts;
@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, assign) double isFinished;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double lastUptrackAt;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, strong) NSString *albumCoverUrl290;
@property (nonatomic, assign) double serialState;
@property (nonatomic, assign) double albumId;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) double priceTypeId;
@property (nonatomic, assign) double lastUptrackId;
@end
