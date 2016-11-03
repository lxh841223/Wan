//
//  TuWanPicViewModel.h
//  BaseProject
//
//  Created by Lxh on 16/11/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanPicViewModel : BaseViewModel
/** 必须使用下方初始化方法 */
- (instancetype)initWithAid:(NSString *)aid;
@property (nonatomic, strong) NSString *aid;

@property (nonatomic, assign) NSInteger rowNumber;
- (NSURL *)picURLForRow:(NSInteger)row;
@property (nonatomic, strong) TuWanPicModel *picModel;
@end
