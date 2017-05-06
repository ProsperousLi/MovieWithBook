//
//  DataBase.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/19.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Tickets.h"

@interface DataBase : NSObject

+ (instancetype)sharedDataBase;


-(void)addPerson:(Person *)person;

-(void)deletePerson:(Person *)person;

-(void)updatePerson:(Person*)person;

-(NSMutableArray *)getAllperson;


/**
 *  给person添加票
 *
 */
- (void)addTicket:(Tickets *)tickets;
/**
 *  给person删除票
 *
 */
- (void)deleteTicket:(Tickets *)tickets;



-(void)updateTicket:(Tickets*)tickets;

/**
 *  获取person的所有票
 *
 */
- (NSMutableArray *)getAllTickets;


@end
