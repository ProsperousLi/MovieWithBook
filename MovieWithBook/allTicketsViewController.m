//
//  allTicketsViewController.m
//  MovieWithBook
//
//  Created by dragon on 16/11/7.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "allTicketsViewController.h"

@interface allTicketsViewController ()

@end

@implementation allTicketsViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的电影票";
    
    _allView = [[allTicketsView alloc] init];
    
    [self.view addSubview:_allView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
