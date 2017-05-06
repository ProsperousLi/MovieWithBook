//
//  cinemaModel.m
//  MovieWithBook
//
//  Created by dragon on 16/10/21.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "cinemaModel.h"

@implementation cinemaModel

-(instancetype)initWithDict:(NSDictionary *)dic {
    if (self = [super init]) {
        
        _weekday = [dic valueForKeyPath:@"futureScheduleStatistics.weekday"];
        
        _cinemaName = [dic valueForKeyPath:@"cinemas.name"];
        
        _price = [dic valueForKeyPath:@"cinemas.minPrice"];
        
        _address = [dic valueForKeyPath:@"cinemas.address"];
        
        _distance = [dic valueForKeyPath:@"cinemas.latLng"];
        
        _idArray = [dic valueForKeyPath:@"cinemas.id"];

    }
    
    return self;
}

@end
