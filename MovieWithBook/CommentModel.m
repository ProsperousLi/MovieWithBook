//
//  CommentModel.m
//  MovieWithBook
//
//  Created by dragon on 17/4/4.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel


- (instancetype)init
{
    self = [super init];
    if (self) {
       
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"douban" ofType:@"json"];

        NSData *data = [[NSData alloc] initWithContentsOfFile:strPath];
        
        NSMutableDictionary *dicc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        self.titleArray = [dicc valueForKeyPath:@"reviews.title"];
        
        self.contentArray = [dicc valueForKeyPath:@"reviews.abstract"];
        
        self.imageArray = [dicc valueForKeyPath:@"reviews.subject.pic.normal"];
        
        self.nameArray = [dicc valueForKeyPath:@"reviews.user.name"];
        
        self.commentURL = [dicc valueForKeyPath:@"reviews.sharing_url"];
        
        self.movieNameArray = [dicc valueForKeyPath:@"reviews.subject.title"];
        
        //NSMutableArray *afterString = [NSMutableArray array];
        
        
        
      //  NSString *regex = @".*?\\.jpg";
        
      //  NSRange range = [regex rangeOfString:[_imageArray objectAtIndex:0] options:NSRegularExpressionSearch];
        
       // if (range.location != NSNotFound) {
         //   NSLog(@"%@", [regex substringWithRange:range]);
        //}else {
          //  NSLog(@"not find");
        //}
        
        //NSLog(@"图片:%@",_imageArray);
        
    }
    return self;
}

@end
