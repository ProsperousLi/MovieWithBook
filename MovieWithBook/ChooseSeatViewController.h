//
//  ChooseSeatViewController.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/27.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseSeatView.h"


@interface ChooseSeatViewController : UIViewController

@property (nonatomic,strong) ChooseSeatView *chooseView;

@property (nonatomic,strong) NSString * item_title;

@property (nonatomic,strong) NSString *cinema_name;

@property (nonatomic,strong) NSString *data;



@property (nonatomic,strong) NSString *type;

@end
