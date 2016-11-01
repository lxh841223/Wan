//
//  TuWanListCell.m
//  BaseProject
//
//  Created by Lxh on 16/10/31.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanListCell.h"

@implementation TuWanListCell
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:16];
    }
    return _titleLb;
}

- (UILabel *)descLb {
    if (!_descLb) {
        _descLb = [UILabel new];
        _descLb.font = [UIFont systemFontOfSize:14];
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.numberOfLines = 0;
    }
    return _descLb;
}

- (UIImageView *)iconIV {
    if (!_iconIV) {
        _iconIV = [UIImageView new];
    }
    return _iconIV;
}

- (UILabel *)clicksNumLb {
    if (!_clicksNumLb) {
        _clicksNumLb = [UILabel new];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
        _clicksNumLb.textAlignment = NSTextAlignmentRight;
    }
    return _clicksNumLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.descLb];
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.clicksNumLb];
        
//图片 左10，宽高92、70， 竖向居中
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(93, 70));
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
        }];
        
//题目 距离图片右边缘8，右边缘10，上边缘比图片上边缘矮3
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin).mas_equalTo(3);
        }];
        
//长题目 左右边缘与题目一样，上边具体题目下边8像素
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_titleLb.mas_leftMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(8);
        }];
        
//点击数，下边缘与图片对齐，右边缘与任意title对齐
        [_clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
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
