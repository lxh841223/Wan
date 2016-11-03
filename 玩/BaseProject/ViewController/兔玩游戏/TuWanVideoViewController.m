//
//  TuWanVideoViewController.m
//  BaseProject
//
//  Created by Lxh on 16/11/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanVideoViewController.h"
#import "TuWanVideoViewModel.h"
#import "TuWanListCell.h"

@interface TuWanVideoViewController ()
@property (nonatomic, strong) TuWanVideoViewModel *videoVM;
@end

@implementation TuWanVideoViewController
{
    UILabel *_titleLb;
    UIButton *_iconBtn;
}
- (TuWanVideoViewModel *)videoVM {
    if (!_videoVM) {
        _videoVM = [[TuWanVideoViewModel alloc] initWithAid:_aid];
    }
    return _videoVM;
}

- (instancetype)initWithAid:(NSString *)aid {
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}

- (UIView *)headerView {
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/750.0 * 500)];
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = kRGBColor(240, 240, 240);
    [headView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _titleLb.text = self.videoVM.videoTitle;
    _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_iconBtn setBackgroundImage:[UIImage imageNamed:@"cell_bg_noData_1"] forState:UIControlStateNormal];
    [headView addSubview:_iconBtn];
    [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    [_iconBtn bk_addEventHandler:^(id sender) {
        DDLogVerbose(@"video被点击了");
    } forControlEvents:UIControlEventTouchUpInside];
    return headView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [Factory addBackItemToVC:self];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM getDataFromNetCompleteHandle:^(NSError *error) {
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
            self.tableView.tableHeaderView = [self headerView];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.videoVM titleForRowInRelevant:indexPath.row];
    cell.descLb.text = [self.videoVM descForRowInRelevant:indexPath.row];
    cell.clicksNumLb.text = [self.videoVM clicksForRowInRelevant:indexPath.row];
    [cell.iconIV setImageWithURL:[self.videoVM iconURLForRowInRelevant:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.videoVM.rowNumber > 0 ? @"为您推荐:" : nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    view.backgroundColor = [UIColor whiteColor];
    _titleLb = [UILabel new];
    _titleLb.text = @"为您推荐:";
    [view addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    return view;
}
@end















