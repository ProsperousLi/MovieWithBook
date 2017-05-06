//
//  AfterFindViewController.h
//  MovieWithBook
//
//  Created by dragon on 16/10/29.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AfterFindView.h"
#import "AfterFindModel.h"

@interface AfterFindViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>
{
   
}
@property (nonatomic,strong) AfterFindView *afterView;

/**
 *  标题
 */
@property (nonatomic,strong) NSString *navigationTitle;

/**
 *  确认点击的是哪个
 */
@property(nonatomic,strong)NSString *indexCell;


/**
 * collectionView
 */
@property (nonatomic,strong) UICollectionView *collectionView;


@property (nonatomic,strong) AfterFindModel *model;

@end
