//
//  AlbumModel.m
//  BaseProject
//
//  Created by Lxh on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel

@end

@implementation AlbumTracksModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list" : [AlbumTracksListModel class]};
}
@end

@implementation AlbumAlbumModel

@end

@implementation AlbumTracksListModel

@end
