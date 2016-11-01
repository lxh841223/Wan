//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by Lxh on 16/10/31.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"

@implementation TuWanImageCell
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:16];
    }
    return _titleLb;
}

- (UILabel *)clickNumLb {
    if (!_clickNumLb) {
        _clickNumLb = [UILabel new];
        _clickNumLb.font = [UIFont systemFontOfSize:12];
        _clickNumLb.textColor = [UIColor lightGrayColor];
        _clickNumLb.textAlignment = NSTextAlignmentRight;
    }
    return _clickNumLb;
}

- (UIImageView *)iconIV0 {
    if (!_iconIV0) {
        _iconIV0 = [UIImageView new];
    }
    return _iconIV0;
}

- (UIImageView *)iconIV1 {
    if (!_iconIV1) {
        _iconIV1 = [UIImageView new];
    }
    return _iconIV1;
}

- (UIImageView *)iconIV2 {
    if (!_iconIV2) {
        _iconIV2 = [UIImageView new];
    }
    return _iconIV2;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.clickNumLb];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
        
//题目 距离左边10, 上边12, 右边10
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(12);
            make.right.mas_equalTo(_clickNumLb.mas_left).mas_equalTo(-10);
        }];
        
//点击数 距离右边10, 上边与题目对齐, 宽度最大70, 最小40
        [_clickNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_titleLb.mas_topMargin);
            make.width.mas_greaterThanOrEqualTo(40);
            make.width.mas_lessThanOrEqualTo(70);
        }];
        
//图片 宽高相等， 边缘10, 上边缘7，间距5 ，高87
        [_iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(7);
            make.height.mas_equalTo(87);
        }];
        
        [_iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0.mas_topMargin);
        }];
        
        [_iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(_iconIV1.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0.mas_topMargin);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
