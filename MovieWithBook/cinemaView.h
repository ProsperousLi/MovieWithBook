//
//  cinemaView.h
//  MovieWithBook
//
//  Created by dragon on 16/10/21.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "cinemaModel.h"
#import "distanceLocation.h"

@interface cinemaView : UIView<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate>


@property (nonatomic,strong) void (^cellDidSelectAction)(NSInteger index);

-(instancetype)init;

@end
