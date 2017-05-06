//
//  Personal.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/11/2.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,assign) NSNumber * ID;

@property (nonatomic,assign) NSNumber * ticketID;

@property (nonatomic,strong) NSString *image;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *describe;

@property (nonatomic,assign) NSNumber * sex;

@property (nonatomic,strong) NSString * city;

@property (nonatomic,assign) NSNumber * year;

@property (nonatomic,assign) NSNumber * month;

@property (nonatomic,assign) NSNumber * day;

@property (nonatomic,strong) NSDate *dateTime;

@end
