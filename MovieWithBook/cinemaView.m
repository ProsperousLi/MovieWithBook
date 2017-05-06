//
//  cinemaView.m
//  MovieWithBook
//
//  Created by dragon on 16/10/21.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "cinemaView.h"


@implementation cinemaView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init {
    if (self = [super init]) {
        
        self.frame = [UIScreen mainScreen].bounds;
        
        self.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
                
        
    }
    
    return self;
}


@end
