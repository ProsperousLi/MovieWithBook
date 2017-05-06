//
//  DetailModel.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

-(instancetype)initWithDic:(NSDictionary *)dict {
    if (self = [super init]) {
        self.information = [dict valueForKeyPath:@"summary"];
        
        NSArray *array = [dict valueForKeyPath:@"aka"];
        
        self.original_title = [array objectAtIndex:[array count] - 1];
        
        self.countries = [dict valueForKeyPath:@"countries"];
        
        self.genres = [dict valueForKeyPath:@"genres"];
    }
    
    return self;
}

@end
