//
//  TopViewController.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopView.h"
#import "DetailViewController.h"
#import "DetailView.h"


@interface TopViewController : UIViewController

@property (nonatomic,strong) TopView *topview;

@property (nonatomic,strong) DetailViewController *detailController;

@property (nonatomic,strong) DetailView *detailView;

@end
