//
//  goodMovieModel.m
//  MovieWithBook
//
//  Created by dragon on 16/10/30.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "goodMovieModel.h"

@implementation goodMovieModel

-(instancetype)initWithDict :(NSDictionary *)dic {
    if (self = [super init]) {
        
        _rowNum = [dic valueForKeyPath:@"showapi_res_body.datalist.RowNum"];
        
        _cinemaName = [dic valueForKeyPath:@"showapi_res_body.datalist.MovieName"];

        _todayBox = [dic valueForKeyPath:@"showapi_res_body.datalist.TodayBox"];

        _todayShowCount = [dic valueForKeyPath:@"showapi_res_body.datalist.TodayShowCount"];

        _avgpeople = [dic valueForKeyPath:@"showapi_res_body.datalist.AvgPeople"];

        _price = [dic valueForKeyPath:@"showapi_res_body.datalist.price"];

        _attendance = [dic valueForKeyPath:@"showapi_res_body.datalist.Attendance"];

    }
    
    return self;
}

@end
