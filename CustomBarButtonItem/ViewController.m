//
//  ViewController.m
//  CustomBarButtonItem
//
//  Created by changshitong on 2018/12/20.
//  Copyright © 2018年 PLAN. All rights reserved.
//

#import "ViewController.h"

#import "PLSingleItemViewController.h"
#import "PLMultipleItemViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            [self gotoSingleItemController];
        }
            break;
        case 1:
        {
            [self gotoMultipleItemController];
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
    }
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - Goto

- (void)gotoSingleItemController
{
    PLSingleItemViewController *controller = [[PLSingleItemViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)gotoMultipleItemController
{
    PLMultipleItemViewController *controller = [[PLMultipleItemViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - Lazy

- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = @[@"single barButtonItem",
                       ];
    }
    return _dataSource;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 50;
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}


@end
