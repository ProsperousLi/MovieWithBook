//
//  DetailModel.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject

@property (nonatomic,strong) NSString* information;

/**
 *  别名
 */
@property (nonatomic,strong) NSString *original_title;

/**
 *  国家
 */
@property (nonatomic,strong) NSMutableArray *countries;

/**
 *  类型
 */
@property (nonatomic,strong) NSMutableArray *genres;


-(instancetype)initWithDic:(NSDictionary *)dict;

@end
