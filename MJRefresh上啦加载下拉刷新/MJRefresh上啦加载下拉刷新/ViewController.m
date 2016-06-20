//
//  ViewController.m
//  MJRefresh上啦加载下拉刷新
//
//  Created by caijiamu on 16/6/16.
//  Copyright © 2016年 cloud.wood-group. All rights reserved.
//

#import "ViewController.h"
#import "MJRefreshTestTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickMJRefreshTestBtn:(UIButton *)sender
{
    MJRefreshTestTableViewController *mjRefresh = [MJRefreshTestTableViewController new];
    [self presentViewController:mjRefresh animated:YES completion:nil];
}

@end
