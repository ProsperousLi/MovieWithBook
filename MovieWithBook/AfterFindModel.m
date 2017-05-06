//
//  AfterFindModel.m
//  MovieWithBook
//
//  Created by dragon on 16/10/30.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "AfterFindModel.h"

@implementation AfterFindModel

-(instancetype)initWithDict :(NSDictionary *)dict {
    if (self = [super init]) {
        self.imageArray = [dict valueForKeyPath:@"subjects.images.large"];
        
        self.mediumImageArray = [dict valueForKeyPath:@"subjects.images.medium"];
        
        //NSLog(@"model");
        //NSLog(@"%@",_imageArray);
        
        self.nameArray = [dict valueForKeyPath:@"subjects.title"];
        
        self.average = [dict valueForKeyPath:@"subjects.rating.average"];
        
        self.type = [dict valueForKeyPath:@"subjects.genres"];
        
        self.casts = [dict valueForKeyPath:@"subjects.casts"];
        
        self.dirctor = [dict valueForKeyPath:@"subjects.directors.name"];
        
        self.idInfomation = [dict valueForKeyPath:@"subjects.id"];
        
    }
    
    
    return self;
}
@end
