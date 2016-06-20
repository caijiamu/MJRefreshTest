//
//  MJRefreshTestTableViewController.m
//  MJRefresh上啦加载下拉刷新
//
//  Created by caijiamu on 16/6/16.
//  Copyright © 2016年 cloud.wood-group. All rights reserved.
//

#import "MJRefreshTestTableViewController.h"
#import "MJRefresh.h"
@interface MJRefreshTestTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MJRefreshTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //下拉刷新
    MJRefreshGifHeader *mjRefreshGif = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestNewData:)];
    [self setImagesWith:mjRefreshGif];
    self.tableView.mj_header = mjRefreshGif;
    
    //上啦加载
    MJRefreshAutoGifFooter *mjRefreshGifFoot = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestMoreData:)];
    [self setImagesWith:mjRefreshGifFoot];
    [mjRefreshGifFoot setTitle:@"" forState:MJRefreshStateIdle];
    self.tableView.mj_footer = mjRefreshGifFoot;
    
}

#pragma mark -  tableviewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"nihao";
    return cell;
}
-(void)setImagesWith:(id)mjRefreshGif
{
    // 设置普通状态的动画图片
//    NSMutableArray *idleImages = [NSMutableArray array];
//    for (NSUInteger i = 1; i<=60; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
//        [idleImages addObject:image];
//    }
//    [mjRefreshGif setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
//    [mjRefreshGif setImages:refreshingImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [mjRefreshGif setImages:refreshingImages forState:MJRefreshStateRefreshing];
}
-(void)requestNewData:(MJRefreshGifHeader *)MJRefresh
{
    NSLog(@"下拉刷新");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MJRefresh endRefreshing];
    });
}
-(void)requestMoreData:(MJRefreshAutoGifFooter *)mjRefreshfoot
{
    NSLog(@"上啦加载");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [mjRefreshfoot endRefreshing];
    });
}

@end
