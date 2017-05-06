//
//  FindViewController.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/20.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindView.h"
#import "AfterFindViewController.h"
#import "MovieWillAppearViewController.h"
#import "goodMovieViewController.h"
#import "WebViewController.h"
#import "MoreInformationViewController.h"

@interface FindViewController : UIViewController

@property (nonatomic,strong) FindView *find;

@property (nonatomic,strong) AfterFindViewController *afterController;

@property (nonatomic,strong) MovieWillAppearViewController *willAppearController;

@property (nonatomic,strong) goodMovieViewController *goodMovieController;

@property (nonatomic,strong) WebViewController *webViewController;

@property (nonatomic,strong) MoreInformationViewController *moreVC;

@end
