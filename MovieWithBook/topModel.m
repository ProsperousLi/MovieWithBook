//
//  topModel.m
//  ZXMovieBrowser
//
//  Created by dragon on 16/9/5.
//  Copyright © 2016年 Shawn. All rights reserved.
//

#import "topModel.h"

@implementation topModel

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

        
        self.dirctor = [dict valueForKeyPath:@"subjects.directors"];

        
        self.idInfomation = [dict valueForKeyPath:@"subjects.id"];
        
        //NSLog(@"%@",self.idInfomation);
    }
    
    
    return self;
}


@end
