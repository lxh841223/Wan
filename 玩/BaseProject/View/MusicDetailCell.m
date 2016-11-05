//
//  MusicDetailCell.m
//  BaseProject
//
//  Created by Lxh on 16/11/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MusicDetailCell.h"

@implementation MusicDetailCell
- (UIImageView *)coverIV {
    if (!_coverIV) {
        _coverIV = [UIImageView new];
        _coverIV.contentMode = UIViewContentModeScaleAspectFill;
        _coverIV.clipsToBounds = YES;
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(55, 55));
            make.left.top.mas_equalTo(12);
        }];
        _coverIV.layer.cornerRadius = 55 / 2;
    //添加播放标识
        UIImageView *playIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_coverIV addSubview:playIV];
        [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(13, 13));
            make.center.mas_equalTo(0);
        }];
        
    }
    return _coverIV;
}

- (UILabel *)titleLB {
    if (!_titleLB) {
        _timeLb = [UILabel new];
        _titleLB.font = [UIFont systemFontOfSize:16];
        _titleLB.numberOfLines = 0;
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(self.timeLb.mas_leftMargin).mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.contentView.mas_topMargin);
        }];
    }
    return _titleLB;
}

- (UILabel *)timeLb {
    if (!_timeLb) {
        _timeLb = [UILabel new];
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.textColor = [UIColor lightGrayColor];
        _timeLb.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(12);
            make.width.mas_equalTo(45);
        }];
    }
    return _timeLb;
}

- (UILabel *)sourceLb {
    if (!_sourceLb) {
        _sourceLb = [UILabel new];
        _sourceLb.font = [UIFont systemFontOfSize:14];
        _sourceLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_sourceLb];
        [_sourceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLB.mas_leftMargin);
            make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(5);
            make.rightMargin.mas_equalTo(self.titleLB.mas_rightMargin);
        }];
    }
    return _sourceLb;
}

- (UILabel *)playCountLb {
    if (!_playCountLb) {
        _playCountLb = [UILabel new];
        _playCountLb.font = [UIFont systemFontOfSize:12];
        _playCountLb.textColor = [UIColor lightGrayColor];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TodayPlayImage"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.leftMargin.mas_equalTo(self.titleLB.mas_leftMargin);
            make.top.mas_equalTo(self.sourceLb.mas_bottom).mas_equalTo(8);
            make.bottom.mas_equalTo(-10);
        }];
        [self.contentView addSubview:_playCountLb];
        [_playCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(2);
            make.centerY.mas_equalTo(imageView);
        }];
    }
    return _playCountLb;
}

- (UILabel *)likeCountLb {
    if (!_likeCountLb) {
        _likeCountLb = [UILabel new];
        _likeCountLb.font = [UIFont systemFontOfSize:12];
        _likeCountLb.textColor = [UIColor lightGrayColor];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sound_likes"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.left.mas_equalTo(self.playCountLb.mas_right).mas_equalTo(8);
            make.centerY.mas_equalTo(self.playCountLb);
        }];
        [self.contentView addSubview:_likeCountLb];
        [_likeCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(2);
            make.centerY.mas_equalTo(imageView);
        }];
        
    }
    return _likeCountLb;
}

- (UILabel *)commentCountLb {
    if (!_commentCountLb) {
        _commentCountLb = [UILabel new];
        _likeCountLb.font = [UIFont systemFontOfSize:12];
        _likeCountLb.textColor = [UIColor lightGrayColor];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sound_comments"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.left.mas_equalTo(self.likeCountLb.mas_right).mas_equalTo(8);
            make.centerY.mas_equalTo(self.likeCountLb);
        }];
        [self.contentView addSubview:_likeCountLb];
        [_likeCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(2);
            make.centerY.mas_equalTo(imageView);
        }];
    }
    return _commentCountLb;
}

- (UILabel *)durationLb {
    if (!_durationLb) {
        _durationLb = [UILabel new];
        _durationLb.font = [UIFont systemFontOfSize:12];
        _durationLb.textColor = [UIColor lightGrayColor];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sound_duration"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.left.mas_equalTo(self.playCountLb.mas_right).mas_equalTo(8);
            make.centerY.mas_equalTo(self.playCountLb);
        }];
        [self.contentView addSubview:_durationLb];
        [_durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(2);
            make.centerY.mas_equalTo(imageView);
        }];
    }
    return _durationLb;
}

- (UIButton *)downloadBtn {
    if (!_downloadBtn) {
        _downloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downloadBtn setBackgroundImage:[UIImage imageNamed:@"cell_download"] forState:UIControlStateNormal];
        [_downloadBtn bk_addEventHandler:^(id sender) {
            DDLogVerbose(@"点击下载音乐中...");
        } forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_downloadBtn];
        [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(24, 24));
            make.bottom.mas_equalTo(-8);
            make.right.mas_equalTo(-10);
        }];
    }
    return _downloadBtn;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    //设置cell被选中后的背景色
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(243, 255, 254);
        self.selectedBackgroundView = view;
    //分割线距离左侧空间
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



















