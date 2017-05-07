//
//  MovieNewsModel.m
//  MovieWithBook
//
//  Created by dragon on 17/4/16.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import "MovieNewsModel.h"

@implementation MovieNewsModel

-(instancetype)initWithDict :(NSDictionary *)dict {
    self = [super init];
    
    if (self) {
        //需要初始化，否则无法添加元素
        self.numberImageViewArray = [[NSMutableArray alloc] initWithCapacity:10];
        
        self.picArray = [[NSMutableArray alloc] initWithCapacity:10];
        
        self.targetIdArray = [[NSMutableArray alloc] initWithCapacity:10];
        
        self.feedType = [dict valueForKeyPath:@"data.feeds.feedType"];
        
        NSMutableArray *imageArray =[[NSMutableArray alloc] initWithCapacity:10];
        
        imageArray = [dict valueForKeyPath:@"data.feeds.images"];

        for (int i = 0; i < [imageArray count]; i++) {

            NSString *topicOrInformaiton = [NSString stringWithFormat:@"%@",[_feedType objectAtIndex:i]];
            
            if ([topicOrInformaiton isEqualToString:@"2"]) {
                topicOrInformaiton = @"topic/";
            }
            else if ([topicOrInformaiton isEqualToString:@"7"] || ![topicOrInformaiton isEqualToString:@"2"]) {
                topicOrInformaiton = @"information/";
            }
            
            [self.numberImageViewArray addObject:[NSString stringWithFormat:@"%lu",(unsigned long)[[imageArray objectAtIndex:i] count]]];
            
            
            
            [self.picArray  addObject:[[imageArray objectAtIndex:i] valueForKey:@"url"]];

            [self.targetIdArray addObject: [NSString stringWithFormat:@"%@%@%@%@",maoyanInfoDetailPre,topicOrInformaiton,[[[imageArray objectAtIndex:i] valueForKey:@"targetId"] objectAtIndex:0],maoyanInfoDetailAfter]];
        }
        
        self.titleArray = [dict valueForKeyPath:@"data.feeds.title"];
        
        self.nickNameArray = [dict valueForKeyPath:@"data.feeds.user.nickName"];
        
        self.visitorCountArray = [dict valueForKeyPath:@"data.feeds.viewCount"];
        
        self.commentCountArray = [dict valueForKeyPath:@"data.feeds.commentCount"];
 
        self.timeArray = [dict valueForKeyPath:@"data.feeds.time"];
        
        NSLog(@"maoyan :%@",self.feedType);
    }
    
    return self;
}

@end
