//
//  XiMaCategoryCell.m
//  BaseProject
//
//  Created by Lxh on 16/11/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiMaCategoryCell.h"

@implementation XiMaCategoryCell
- (UILabel *)orderLb {
    if (!_orderLb) {
        _orderLb = [UILabel new];
        _orderLb.font = [UIFont boldSystemFontOfSize:18];
        _orderLb.textAlignment = NSTextAlignmentCenter;
        //使用KVO-键值观察，如果text被赋值为1，颜色是...
        //下方方法：如果_orderLb的text属性 被赋 新值，则触发task
        [self.contentView addSubview:_orderLb];
        [_orderLb bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            NSString *value = change[@"new"];
            if ([value isEqualToString:@"1"]) {
                _orderLb.textColor = [UIColor redColor];
            }else if ([value isEqualToString:@"2"]) {
                _orderLb.textColor = [UIColor blueColor];
            }else if ([value isEqualToString:@"3"]) {
                _orderLb.textColor = [UIColor greenColor];
            }else{
                _orderLb.textColor = [UIColor lightGrayColor];
            }
        }];
        [_orderLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(35);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _orderLb;
}

- (UIImageView *)iconIV {
    if (!_iconIV) {
        _iconIV = [UIImageView new];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.left.mas_equalTo(self.orderLb.mas_right).mas_equalTo(0);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

- (UILabel *)descLb {
    if (!_descLb) {
        _descLb = [UILabel new];
        _descLb.font = [UIFont systemFontOfSize:14];
        _descLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-10);
        }];
    }
    return _descLb;
}

- (UIImageView *)numberIV {
    if (!_numberIV) {
        _numberIV = [UIImageView new];
        _numberIV.image = [UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIV];
        [_numberIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }
    return _numberIV;
}

- (UILabel *)numberLb {
    if (!_numberLb) {
        _numberLb = [UILabel new];
        _numberLb.font = [UIFont systemFontOfSize:12];
        _numberLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_numberLb];
        [_numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIV.mas_right).mas_equalTo(2);
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIV);
        }];
    }
    return _numberLb;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    //右箭头样式
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //分割线左间距调整
        self.separatorInset = UIEdgeInsetsMake(0, 105, 0, 0);
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
