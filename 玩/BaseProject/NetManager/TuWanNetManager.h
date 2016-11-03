//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by Lxh on 16/10/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
#import "TuWanVideoModel.h"
#import "TuWanPicModel.h"

typedef NS_ENUM(NSUInteger, InfoType) {
    InfoTypeTouTiao,    //头条
    InfoTypeDuJia,      //独家
    InfoTypeAnHei3,     //暗黑3
    InfoTypeMoShou,     //魔兽
    InfoTypeFengBao,    //风暴
    InfoTypeLuShi,      //炉石
    InfoTypeXingJi2,    //星际2
    InfoTypeShouWang,   //守望
    InfoTypeTuPian,     //图片
    InfoTypeShiPin,     //视频
    InfoTypeGongLue,    //攻略
    InfoTypeWanHua,     //幻化
    InfoTypeQuWen,      //趣闻
    InfoTypeCos,        //cos
    InfoTypeMeiNv,      //美女
};
@interface TuWanNetManager : BaseNetManager

/**
 获取某种类型的资讯

 @param type  资讯的类型
 @param start 当前资讯起始的索引值，最小为0。 eg:0,11,21,31,41...

 @return 返回网络请求任务
 */
+ (id)getTuWanWithType:(InfoType)type start:(NSInteger)start kCompletionHandle;

/**
 获取视频类型资讯的详情页

 @param aid 资讯id

 @return 返回网络请求任务
 */
+ (id)getVideoDetailWithId:(NSString *)aid kCompletionHandle;

/**
 获取图片类型资讯的详情页

 @param aid 资讯id

 @return 返回网络请求任务
 */
+ (id)getPicDetailWithId:(NSString *)aid kCompletionHandle;
@end

































