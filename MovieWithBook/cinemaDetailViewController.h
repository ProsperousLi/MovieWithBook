//
//  cinemaDetailViewController.h
//  MovieWithBook
//
//  Created by dragon on 16/10/22.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cinemaDetailView.h"
#import "ChooseSeatViewController.h"

@interface cinemaDetailViewController : UIViewController

@property (nonatomic,strong) NSString* navagetionTitle;

@property (nonatomic,strong) cinemaDetailView *DetailView;

@property (nonatomic,strong) ChooseSeatViewController *chooseController;

@property (nonatomic,strong) NSMutableArray *timeArray;

@end
