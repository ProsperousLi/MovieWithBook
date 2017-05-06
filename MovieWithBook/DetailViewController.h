//
//  DetailViewController.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"
#import "personalViewController.h"
#import "cinemaViewController.h"

@interface DetailViewController : UIViewController

@property (nonatomic,strong) DetailView *detailView;

@property (nonatomic,strong) personalViewController *perVC;

@property (nonatomic,strong) NSString * currentTitle;

@property (nonatomic,strong) NSString *original_title;

@property (nonatomic,strong) NSString *largeImage;

@property (nonatomic,strong) NSString *mediumImage;

@property (nonatomic,strong) NSString *average;

@property (nonatomic,strong) NSString *type;

@property (nonatomic,strong) NSMutableArray *castsName;

@property (nonatomic,strong) NSMutableArray *castsImage;

@property (nonatomic,strong) NSMutableArray *dirctorName;

@property (nonatomic,strong) NSArray *dirctorImage;


@property (nonatomic,strong) NSString *idItem;

@property float yuanHeight;

@property float height;


/**
 *  导演照片
 */
@property (nonatomic,strong) UIImageView *directorsImageView;


@end
