//
//  goodMovieModel.h
//  MovieWithBook
//
//  Created by dragon on 16/10/30.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface goodMovieModel : NSObject

/**
 * 排名
 */
@property (nonatomic,strong) NSMutableArray *rowNum;

/**
 * 影院名称
 */
@property (nonatomic,strong) NSMutableArray *cinemaName;

/**
 *  单日票房
 */
@property (nonatomic,strong) NSMutableArray *todayBox;

/**
 *  单日场次
 */
@property (nonatomic,strong) NSMutableArray *todayShowCount;


/**
 *  场均人次
 */
@property (nonatomic,strong) NSMutableArray *avgpeople;


/**
 *  场均票价
 */
@property (nonatomic,strong) NSMutableArray *price;

/**
 *  上座率
 */
@property (nonatomic,strong) NSMutableArray *attendance;


-(instancetype)initWithDict :(NSDictionary *)dic;


@end
