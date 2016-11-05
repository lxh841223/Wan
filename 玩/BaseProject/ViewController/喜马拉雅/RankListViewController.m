//
//  RankListViewController.m
//  BaseProject
//
//  Created by Lxh on 16/10/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "XiMaCategoryViewModel.h"
#import "XiMaCategoryCell.h"

@interface RankListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) XiMaCategoryViewModel *ximaVM;
@end

@implementation RankListViewController
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XiMaCategoryCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.ximaVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error];
                }else{
                    [_tableView reloadData];
                }
                //重置脚步 没有更多数据
                [_tableView.mj_footer resetNoMoreData];
                [_tableView.mj_header endRefreshing];
                
            }];
        }];
        
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.ximaVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    //[self showErrorMsg:error.localizedDescription];
                    if (error.code == 999) {
                        [self.tableView.mj_footer endRefreshingWithNoMoreData];
                    }else{
                        [_tableView.mj_footer endRefreshing];
                    }
                }else{
                    [_tableView reloadData];
                    [_tableView.mj_footer endRefreshing];
                }
            }];
        }];
    }
    return _tableView;
}

- (XiMaCategoryViewModel *)ximaVM {
    if (!_ximaVM) {
        _ximaVM = [XiMaCategoryViewModel new];
    }
    return _ximaVM;
}

+ (UINavigationController *)defaultNavi {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RankListViewController *vc = [RankListViewController new];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.title = @"音乐TOP50";
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ximaVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XiMaCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.ximaVM titleForRow:indexPath.row];
    cell.descLb.text = [self.ximaVM descForRow:indexPath.row];
    cell.numberLb.text = [self.ximaVM numberForRow:indexPath.row];
    [cell.iconIV setImageWithURL:[self.ximaVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.orderLb.text = @(indexPath.row + 1).stringValue;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end








