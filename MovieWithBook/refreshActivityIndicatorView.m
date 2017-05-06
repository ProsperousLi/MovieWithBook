//
//  refreshActivityIndicatorView.m
//  MovieWithBook
//
//  Created by dragon on 17/5/6.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import "refreshActivityIndicatorView.h"

@implementation refreshActivityIndicatorView

-(instancetype)init
{
    self = [super init];
    if (self) {
        // 菊花背景的大小
        self.frame = CGRectMake(kWidth/2-50, KHeight/2-50, 100, 100);
        // 菊花的背景色
        self.backgroundColor = MYCOLOR;
        self.layer.cornerRadius = 10;
        // 菊花的颜色和格式（白色、白色大、灰色）
        self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        // 在菊花下面添加文字
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 80, 40)];
        label.text = @"loading...";
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
    }
    return  self;
}



@end
