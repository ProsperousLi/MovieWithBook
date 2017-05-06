//
//  Tickets.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/11/2.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tickets : NSObject

@property (nonatomic,strong) NSNumber *own_id;

@property (nonatomic,strong) NSString *movie;

@property (nonatomic,strong) NSString *cinemaName;
/**
 *  几张票
 */
@property (nonatomic,assign) NSInteger numbserTickes;

@property (nonatomic,assign) NSInteger price;

@property (nonatomic,assign) NSInteger roomNumber;

@property (nonatomic,assign) NSInteger pai;

@property (nonatomic,assign) NSInteger zuo;

@end
