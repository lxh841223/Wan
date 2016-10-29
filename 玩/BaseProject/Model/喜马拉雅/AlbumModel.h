//
//  AlbumModel.h
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class AlbumTracksModel, AlbumAlbumModel, AlbumTracksListModel;

@interface AlbumModel : BaseModel
@property (nonatomic, strong) AlbumTracksModel *tracks;
@property (nonatomic, strong) AlbumAlbumModel *album;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double ret;
@end

@interface AlbumTracksModel : BaseModel
@property (nonatomic, assign) double maxPageId;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, assign) double pageId;
@property (nonatomic, assign) double pageSize;
@property (nonatomic, assign) double totalCount;
@end

@interface AlbumAlbumModel : BaseModel
@property (nonatomic, assign) double playTimes;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, assign) BOOL hasNew;
@property (nonatomic, assign) double serializeStatus;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *introRich;
@property (nonatomic, assign) BOOL isFavorite;
@property (nonatomic, assign) BOOL isVerified;
@property (nonatomic, assign) double playTrackId;
@property (nonatomic, assign) double shares;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, strong) NSString *coverLargePop;
@property (nonatomic, assign) BOOL isRecordDesc;
@property (nonatomic, assign) double zoneId;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) double serialState;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, assign) double lastUptrackAt;
@property (nonatomic, assign) double followers;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *coverOrigin;
@property (nonatomic, strong) NSString *coverWebLarge;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double tracks;
@property (nonatomic, assign) BOOL isFollowed;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *avatarPath;
@property (nonatomic, strong) NSString *coverSmall;
@end

@interface AlbumTracksListModel : BaseModel
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double likes;
@property (nonatomic, assign) double userSource;
@property (nonatomic, assign) double duration;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) double processState;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, strong) NSString *playPathHq;
@property (nonatomic, assign) double shares;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, strong) NSString *playPathAacv224;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *smallLogo;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double playtimes;
@property (nonatomic, strong) NSString *playUrl64;
@property (nonatomic, strong) NSString *playPathAacv164;
@property (nonatomic, strong) NSString *playUrl32;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, assign) double comments;
@property (nonatomic, assign) double trackId;
@property (nonatomic, assign) double opType;
@property (nonatomic, assign) BOOL isPublic;
@end






















