//
//  PLSingleItemViewController.m
//  CustomBarButtonItem
//
//  Created by changshitong on 2018/12/20.
//  Copyright © 2018年 PLAN. All rights reserved.
//

#import "PLSingleItemViewController.h"

@interface PLSingleItemViewController ()

@end

@implementation PLSingleItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBarButtonItem];
}

- (void)setUpNavBarButtonItem
{
    __weak typeof(self) wr = self;
    
    [self setLeftBarButtonItemTitle:@"back" actionBlock:^(NSInteger index) {
        [wr leftBarButtonItemAction:index];
    }];
    
    [self setRightBarButtonItemTitle:@"next" actionBlock:^(NSInteger index) {
        [wr rightBarButtonItemAction:index];
    }];
}

- (void)leftBarButtonItemAction:(NSInteger)selectedIndex
{
    NSLog(@"selected item: index = %ld",selectedIndex);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonItemAction:(NSInteger)selectedIndex
{
    NSLog(@"selected item: index = %ld",selectedIndex);
    
    PLSingleItemViewController *controller = [[PLSingleItemViewController alloc] init];
    controller.title = [NSString stringWithFormat:@"%d",self.title.intValue + 1];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
