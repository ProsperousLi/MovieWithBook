//
//  MovieNewsModel.h
//  MovieWithBook
//
//  Created by dragon on 17/4/16.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieNewsModel : NSObject

/**
 * 图片
 */
@property (nonatomic,strong) NSMutableArray * picArray;

/**
 * 判断每条资讯简易显示时，有几张图片，根据此数组可以选择合适的布局方式显示资讯图片,大于3张默认为3
 */
@property(nonatomic,strong) NSMutableArray *numberImageViewArray;

/**
 * 标题
 */
@property (nonatomic,strong) NSMutableArray * titleArray;

/**
 * 作者
 */
@property (nonatomic,strong) NSMutableArray *nickNameArray;

/**
 * 查看人数visitorCount
 */
@property (nonatomic,strong) NSMutableArray *visitorCountArray;

/**
 *commentCount 评论数
 */
@property (nonatomic,strong) NSMutableArray *commentCountArray;

/**
 * 时间戳
 */
@property (nonatomic,strong) NSMutableArray *timeArray;

/**
 * 资讯详情id
 */
@property (nonatomic,strong) NSMutableArray  *targetIdArray;

/**
 *  判断是资讯还是话题(2为话题topic，7为资讯information)
 */
@property (nonatomic,strong) NSMutableArray *feedType;

/**
 * 初始化
 */
-(instancetype)initWithDict :(NSDictionary *)dict ;

@end
