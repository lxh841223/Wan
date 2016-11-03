//
//  TuWanVideoModel.h
//  BaseProject
//
//  Created by Lxh on 16/11/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface TuWanVideoModel : BaseModel
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *showtype;
@property (nonatomic, strong) NSString *click;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *typechild;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *longtitle;
@property (nonatomic, strong) NSString *html5;
@property (nonatomic, assign) id toutiao;
@property (nonatomic, strong) NSString *litpic;
@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *pubdate;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *murl;
@property (nonatomic, strong) NSString *banner;
@property (nonatomic, strong) NSString *writer;
@property (nonatomic, assign) id timer;
@property (nonatomic, strong) NSArray *relevant;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSArray *content;
@property (nonatomic, strong) NSString *desc;
@end

@interface TuWanVideoRelevantModel : BaseModel
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *litpic;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *longtitle;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *click;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *typechild;
@property (nonatomic, strong) NSString *writer;
@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *pubdate;
@end

@interface TuWanVideoContentModel : BaseModel
@property (nonatomic, strong) NSString *video;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@end
