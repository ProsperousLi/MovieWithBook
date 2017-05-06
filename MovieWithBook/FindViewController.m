//
//  FindViewController.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/20.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _find = [[FindView alloc] init];
    

    
    [self.view addSubview:_find];
    
    [self block];
    
    // Do any additional setup after loading the view.
}

-(void)block {
    
    
    __weak typeof (self)weakSelf = self;

    _find.cellDidSelectAction = ^(NSInteger index,NSArray *array) {
        
        if (index == 0) {
            weakSelf.afterController = [[AfterFindViewController alloc] init];
            
            weakSelf.afterController.navigationTitle = [array objectAtIndex:index];
            
            weakSelf.afterController.indexCell = [NSString stringWithFormat:@"%ld",(long)index];
            
            [weakSelf.navigationController pushViewController:weakSelf.afterController animated:YES];
        }
        else if (index == 1) {
            weakSelf.willAppearController = [[MovieWillAppearViewController alloc] init];
            
            weakSelf.willAppearController.navigationTitle = [array objectAtIndex:index];
            
            [weakSelf.navigationController pushViewController:weakSelf.willAppearController animated:YES];

        }
        
        else if (index == 2) {
            
            weakSelf.goodMovieController = [[goodMovieViewController alloc] init];
            
            weakSelf.goodMovieController.navigationTitle = [array objectAtIndex:index];
            
            [weakSelf.navigationController pushViewController:weakSelf.goodMovieController animated:YES];

        }
        
        else if (index == 3) {
            weakSelf.webViewController = [[WebViewController alloc] init];
            
            weakSelf.webViewController.navigationItem.title = @"商城";
            
            weakSelf.webViewController.commentURL = shoppingUrl;
            
            [weakSelf.navigationController pushViewController:weakSelf.webViewController animated:YES];
        }

    };
    
    _find.commentDetailAction = ^(NSInteger index,NSArray *array) {
        
        weakSelf.webViewController = [[WebViewController alloc] init];
        
        weakSelf.webViewController.navigationItem.title = @"影评详情";
        
        weakSelf.webViewController.commentURL = [array objectAtIndex:index];
        
        [weakSelf.navigationController pushViewController:weakSelf.webViewController animated:YES];
        
    };
    
    _find.NewsAction = ^(NSString *url) {
        weakSelf.webViewController = [[WebViewController alloc] init];
        
        weakSelf.webViewController.navigationItem.title = @"资讯";
        
        weakSelf.webViewController.commentURL = url;
        
        [weakSelf.navigationController pushViewController:weakSelf.webViewController animated:YES];
    };
    
    _find.moreAction = ^(NSInteger tag) {
        
        
        weakSelf.moreVC = [[MoreInformationViewController alloc] init];
        
        
        if (tag == 1) {
            
            weakSelf.moreVC.index = 1;
            
            weakSelf.moreVC.navigationItem.title = @"豆瓣影评";
            
            weakSelf.moreVC.titleArray = weakSelf.find.commentModel.titleArray;
            
            weakSelf.moreVC.imageArray = weakSelf.find.commentModel.imageArray;
            
            weakSelf.moreVC.nickName = weakSelf.find.commentModel.nameArray;
            
            weakSelf.moreVC.contentArray = weakSelf.find.commentModel.contentArray;
            
            weakSelf.moreVC.movieName = weakSelf.find.commentModel.movieNameArray;
            
            weakSelf.moreVC.urlArray = weakSelf.find.commentModel.commentURL;
            
        }
        else if (tag == 2) {
            
            weakSelf.moreVC.index = 2;
            
            weakSelf.moreVC.navigationItem.title = @"猫眼资讯";
            
            
            weakSelf.moreVC.titleArray = weakSelf.find.newsModel.titleArray;
            
            weakSelf.moreVC.imageArray = weakSelf.find.newsModel.picArray;
            
            weakSelf.moreVC.nickName = weakSelf.find.newsModel.nickNameArray;
            
            weakSelf.moreVC.numberImageViewArray = weakSelf.find.newsModel.numberImageViewArray;
            
            weakSelf.moreVC.maoyanTime = weakSelf.find.newsModel.titleArray;
            
            weakSelf.moreVC.urlArray = weakSelf.find.newsModel.targetIdArray;
        }
        
        [weakSelf.navigationController pushViewController:weakSelf.moreVC animated:YES];
        
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
