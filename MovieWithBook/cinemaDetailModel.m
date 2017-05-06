//
//  cinemaDetailModel.m
//  MovieWithBook
//
//  Created by dragon on 16/10/22.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "cinemaDetailModel.h"

@implementation cinemaDetailModel

-(instancetype)initWithDict :(NSDictionary *)dict {
    if (self = [super init]) {
    
        _topModel = [[topModel alloc] init];
        
        //_movieName = _topModel.nameArray;
        
        _movieName = [dict valueForKeyPath:@"data.movies.movie_name"];
        
        
        _movieImage = [dict valueForKeyPath:@"data.movies.movie_picture"];
    
        //_movieImage = _topModel.imageArray;
        
        _movieScore = [dict valueForKeyPath:@"data.movies.movie_score"];
        
        _movieLenght = [dict valueForKeyPath:@"data.movies.movie_length"];
        
        _movieTags = [dict valueForKeyPath:@"data.movies.movie_tags"];
        
        _movieStarring = [dict valueForKeyPath:@"data.movies.movie_starring"];
        
        _movieType = [dict valueForKeyPath:@"data.movies.movie_type"];
        
        _timeTable = [dict valueForKeyPath:@"data.movies.time_table"];

        _movie = [dict valueForKeyPath:@"data.movies"];
    }
    
    return self;
}

@end
