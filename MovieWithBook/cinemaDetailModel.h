//
//  cinemaDetailModel.h
//  MovieWithBook
//
//  Created by dragon on 16/10/22.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "topModel.h"

@interface cinemaDetailModel : NSObject

@property (nonatomic,strong) topModel *topModel;

@property (nonatomic,strong) NSMutableArray *review;

/**
 *  影名
 */
@property (nonatomic,strong) NSMutableArray *movieName;


/**
 * 图片
 */
@property (nonatomic,strong) NSMutableArray *movieImage;

/**
 * 电影播放方式
 */
@property (nonatomic,strong) NSMutableArray *movieType;

/**
 * 演员
 */
@property (nonatomic,strong) NSMutableArray *movieStarring;

/**
 * 放映时间
 */
@property (nonatomic,strong) NSMutableArray *movieReleaseDate;

/**
 * 影片时长
 */
@property (nonatomic,strong) NSMutableArray *movieLenght;

/**
 * 影片评分
 */
@property (nonatomic,strong) NSMutableArray *movieScore;

/**
 * 影片类型
 */
@property (nonatomic,strong) NSMutableArray *movieTags;

@property (nonatomic,strong) NSMutableArray *timeTable;

@property (nonatomic,strong)NSMutableArray *movie;

-(instancetype)initWithDict :(NSDictionary *)dict;

@end
