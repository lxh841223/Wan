//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by Lxh on 16/10/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListCell.h"
#import "TuWanImageCell.h"

@interface TuWanListViewController ()
@property (nonatomic, strong) TuWanViewModel *tuWanVM;
@end

@implementation TuWanListViewController
- (TuWanViewModel *)tuWanVM {
    if (!_tuWanVM) {
        _tuWanVM = [[TuWanViewModel alloc] initWithType:_infoType.integerValue];
    }
    return _tuWanVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuWanVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.tuWanVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tuWanVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (![self.tuWanVM containImages:indexPath.row]) {
        TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
        cell.titleLb.text = [self.tuWanVM titleForRowInList:indexPath.row];
        cell.descLb.text = [self.tuWanVM descForRowInList:indexPath.row];
        [cell.iconIV setImageWithURL:[self.tuWanVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
        cell.clicksNumLb.text = [self.tuWanVM clicksForRowInList:indexPath.row];
        return cell;
        
    }else{
        
        TuWanImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLb.text = [self.tuWanVM titleForRowInList:indexPath.row];
        cell.clickNumLb.text = [self.tuWanVM clicksForRowInList:indexPath.row];
        [cell.iconIV0 setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][0]];
        [cell.iconIV1 setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][1]];
        [cell.iconIV2 setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][2]];
        return cell;
    }
}
/**去掉分割线左侧缝隙*/
kRemoveCellSeparator

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tuWanVM containImages:indexPath.row] ? 134 : 90;
}
@end





















