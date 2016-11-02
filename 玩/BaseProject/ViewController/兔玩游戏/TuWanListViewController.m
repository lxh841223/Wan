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
#import "iCarousel.h"
#import "TuWanHtmlViewController.h"

@interface TuWanListViewController () <iCarouselDelegate, iCarouselDataSource>
@property (nonatomic, strong) TuWanViewModel *tuWanVM;
@end

@implementation TuWanListViewController
{//添加成员变量，因为不需要懒加载，所以不需要是属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
/** 头部滚动视图 */
- (UIView *)headerView {
    [_timer invalidate];
//如果当前没有头部视图，返回nil
    if (!self.tuWanVM.isExistIndexPic) return nil;
    
//头部视图 origin无效，宽度无效，肯定是与table同宽
//比例 750 ＊ 500
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/750.0 * 500)];
//添加底部视图
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
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.tuWanVM.indexPicNumber;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(10);
    }];
    _titleLb.text = [self.tuWanVM titleForRowInIndexPic:0];
//添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
//如果只有一张图，则不显示圆点
    _pageControl.hidesForSinglePage = YES;
//如果只有一张图，则不可以滚动
    _ic.scrollEnabled = self.tuWanVM.indexPicNumber != 1;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    if (self.tuWanVM.indexPicNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    
//小圆点 不能与用户交互
    _pageControl.userInteractionEnabled = NO;
    return headView;
}
#pragma mark - iCarousel
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.tuWanVM.indexPicNumber;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750.0 * 500 - 35)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.tuWanVM iconURLForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return view;
}

/** 允许循环滚动 */
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return  value;
}
/** 监控当前滚动到第几个 */
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    NSLog(@"%ld", carousel.currentItemIndex);
    _titleLb.text = [self.tuWanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}

/** 滚动栏中被选中后触发 */
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    if ([self.tuWanVM isHtmlInIndexPicForRow:index]) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc] initWithURL:[self.tuWanVM detailURLForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


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
    
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [self.tuWanVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
            self.tableView.tableHeaderView = [self headerView];
        }];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.tuWanVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
            self.tableView.tableHeaderView = [self headerView];
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
        [cell.iconIV0 setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV1 setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV2 setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        return cell;
    }
}
/**去掉分割线左侧缝隙*/
kRemoveCellSeparator

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.tuWanVM isHtmlInListForRow:indexPath.row]) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc] initWithURL:[self.tuWanVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
@end





















