//
//  topModel.h
//  ZXMovieBrowser
//
//  Created by dragon on 16/9/5.
//  Copyright © 2016年 Shawn. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface topModel : NSObject

/**
 *  图片数组
 */
@property (nonatomic,strong) NSMutableArray *imageArray;

@property (nonatomic,strong) NSMutableArray *mediumImageArray;

@property (nonatomic,strong) NSMutableArray *nameArray;

@property (nonatomic,strong)NSMutableArray *average;

@property (nonatomic,strong)NSMutableArray *type;

@property (nonatomic,strong) NSMutableArray *casts;


@property (nonatomic,strong) NSMutableArray *dirctor;



@property (nonatomic,strong) NSMutableArray *idInfomation;

-(instancetype)initWithDict :(NSDictionary *)dic;


@end
