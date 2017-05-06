//
//  cinemaModel.h
//  MovieWithBook
//
//  Created by dragon on 16/10/21.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cinemaModel : NSObject

/**
 * 日期
 */
@property (nonatomic,strong) NSMutableArray *weekday;

/**
 * 影院名称
 */
@property (nonatomic,strong) NSMutableArray *cinemaName;

/**
 * 最低价格
 */
@property (nonatomic,strong) NSMutableArray *price;

/**
 * 详细地址
 */
@property (nonatomic,strong) NSMutableArray *address;

/**
 * 距离
 */
@property (nonatomic,strong) NSMutableArray *distance;

/**
 * id
 */
@property (nonatomic,strong) NSMutableArray *idArray;


-(instancetype)initWithDict :(NSDictionary *)dic;

@end
