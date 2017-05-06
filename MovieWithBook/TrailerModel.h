//
//  TrailerModel.h
//  MovieWithBook
//
//  Created by dragon on 17/5/6.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrailerModel : NSObject


/**
 *  image
 */
@property (nonatomic,strong) NSMutableArray *imageArray;

/**
 *  title
 */
@property (nonatomic,strong) NSMutableArray *titleArray;

/**
 * content
 */
@property (nonatomic,strong) NSMutableArray *contentArray;

/**
 * url
 */
@property (nonatomic,strong) NSMutableArray *urlArray;


-(instancetype)initWithDict:(NSDictionary *)dict;

@end
