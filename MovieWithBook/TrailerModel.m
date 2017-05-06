//
//  TrailerModel.m
//  MovieWithBook
//
//  Created by dragon on 17/5/6.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import "TrailerModel.h"

@implementation TrailerModel

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.imageArray = [dict valueForKeyPath:@"data.img"];
        
        self.titleArray = [dict valueForKeyPath:@"data.movieName"];
        
        self.contentArray = [dict valueForKeyPath:@"data.originName"];
        
        self.urlArray = [dict valueForKeyPath:@"data.url"];
    }
    
    return self;
}

@end
