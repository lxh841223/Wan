//
//  XiMaAlbumViewModel.h
//  BaseProject
//
//  Created by Lxh on 16/11/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"

@interface XiMaAlbumViewModel : BaseViewModel
/** 专门初始化方法 */
- (instancetype)initWithAlbumId:(NSInteger)albumId NS_DESIGNATED_INITIALIZER;
@property (nonatomic, assign) NSInteger albumId;
/** 行数 */
@property (nonatomic, assign) NSInteger rowNumber;
/** 当前页数 */
@property (nonatomic, assign) NSInteger pageId;
/** 总页数 */
@property (nonatomic, assign) NSInteger maxPageId;
/** 是否有更多页 */
@property (nonatomic, getter=isHasMore) BOOL hasMore;
/** 获取某行的图片url */
- (NSURL *)coverURLForRow:(NSInteger)row;
/** 获取某行的标题 */
- (NSString *)titleForRow:(NSInteger)row;
/** 获取某行的更新时间 */
- (NSString *)timeForRow:(NSInteger)row;
/** 获取某行的出处 */
- (NSString *)sourceForRow:(NSInteger)row;
/** 获取某行的播放次数 */
- (NSString *)playCountForRow:(NSInteger)row;
/** 获取某行的喜爱数 */
- (NSString *)likesForRow:(NSInteger)row;
/** 获取某行的评论数 */
- (NSString *)commentsForRow:(NSInteger)row;
/** 获取某行的播放时长 */
- (NSString *)durationForRow:(NSInteger)row;
/** 获取某行的下载地址 */
//- (NSURL *)downLoadURLForRow:(NSInteger)row;
/** 获取某行音频的播放地址 */
- (NSURL *)musicURLForRow:(NSInteger)row;


@end
