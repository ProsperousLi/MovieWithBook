//
//  CommentModel.h
//  MovieWithBook
//
//  Created by dragon on 17/4/4.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject

/** 
 * 标题 
 */

@property (nonatomic,strong) NSMutableArray *titleArray;

/**
 * 内容简述
 */

@property (nonatomic,strong) NSMutableArray *contentArray;

/**
 * 图片
 */
@property (nonatomic,strong) NSMutableArray *imageArray;

/**
 * 评论人
 */
@property (nonatomic,strong) NSMutableArray *nameArray;

/**
 * 电影名称
 */
@property (nonatomic,strong) NSMutableArray *movieNameArray;

/**
 * 具体评论网址
 */
@property (nonatomic,strong) NSMutableArray *commentURL;

@end
