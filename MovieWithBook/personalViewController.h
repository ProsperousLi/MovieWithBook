//
//  personalViewController.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "personalView.h"

@interface personalViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *personalTableView;

@property (nonatomic,strong) personalView *personView;

@property (nonatomic,strong) Person *persontwo;

@end
