//
//  DataBase.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/19.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "DataBase.h"

static DataBase *_DBCtl = nil;

@interface DataBase()<NSCopying,NSMutableCopying>{
    FMDatabase  *_db;
    
}
@end

@implementation DataBase : NSObject 

+(instancetype)sharedDataBase{
    
    if (_DBCtl == nil) {
        
        _DBCtl = [[DataBase alloc] init];
        
        [_DBCtl initDataBase];
        
    }
    
    return _DBCtl;
    
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    if (_DBCtl == nil) {
        
        _DBCtl = [super allocWithZone:zone];
        
    }
    
    return _DBCtl;
    
}

-(id)copy{
    
    return self;
    
}

-(id)mutableCopy{
    
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    return self;
    
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    
    return self;
    
}


-(void)initDataBase{
    // 获得Documents目录路径
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 文件路径
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"MYSQ.sqlite"];
    
    // 实例化FMDataBase对象
    
    _db = [FMDatabase databaseWithPath:filePath];
    
    BOOL open = [_db open];
    
    if(open){
        NSLog(@"数据库打开成功");
    }
    else{
        NSLog(@"数据库打开失败");
    }
    
    // 初始化数据表
    NSString *personSql = @" create table person ('id' INTEGER primary key not null,'tickes_id' INTEGER ,'image' varchar(255),'name' varchar(255),'describe' varchar(255),'sex' INTEGER,'city' varchar(255),'year' INTEGER,'month' INTEGER,'day' INTEGER)";
    
    NSString *tickesSql = @" create table Tickes ('id' INTEGER primary key not null,'movie' varchar(255),'cinema' varchar(255),'numberTickes' INTEGER,'price' INTEGER,'roomNumber' INTEGER,'pai' INTEGER,'zuo' INTEGER) ";
    
    if ([self isTableOK:@"person"] == NO && [self isTableOK:@"Tickes"] == NO) {
        [_db executeUpdate:personSql];
        
        [_db executeUpdate:tickesSql];
    }
    
    [_db executeUpdate:personSql];
    
    [_db executeUpdate:tickesSql];
    
    [_db close];
    
}

/**
 *  判断表是否存在
 */

- (BOOL) isTableOK:(NSString *)tableName
{
    FMResultSet *rs = [_db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
    while ([rs next])
    {
        // just print out what we've got in a number of formats.
        NSInteger count = [rs intForColumn:@"count"];
        NSLog(@"isTableOK %ld", (long)count);
        
        if (0 == count)
        {
            NSLog(@"没有表");
            return NO;
        }
        else
        {
            NSLog(@"有表%@",tableName);
            
            return YES;
        }
    }
    
    return NO;
}


#pragma marrk - 对数据库的数据进行操作
- (void)addPerson:(Person *)person{
    [_db open];

    NSNumber *maxID = @(0);
    
    FMResultSet *res = [_db executeQuery:@"SELECT * FROM person "];
    //获取数据库中最大的ID
    while ([res next]) {
        if ([maxID integerValue] < [[res stringForColumn:@"person_id"] integerValue]) {
            maxID = @([[res stringForColumn:@"person_id"] integerValue] ) ;
        }
        
    }
    maxID = @([maxID integerValue] + 1);
    

    BOOL c1 = [_db executeUpdate:@"INSERT INTO person(id,tickes_id,image,name,describe,sex,city,year,month,day)VALUES(?,?,?,?,?,?,?,?,?,?)", maxID,person.ticketID,person.image,person.name,person.describe,person.sex,person.city,person.year,person.month,person.day];
    
    if(c1){
        NSLog(@"%@",@"插入成功");
        
        
    } else {
        NSLog(@"%@",@"插入失败");
        
        }
    

    
    [_db close];

   // NSLog(@"%d%d%@%@%@%d%@",person.ID, person.ticketID, person.image,person.name,person.describe,person.sex,person.city);

}

- (void)deletePerson:(Person *)person{
    [_db open];
    
    [_db executeUpdate:@"DELETE FROM person WHERE id = ?",person.ID];
    
    [_db close];
}

- (void)updatePerson:(Person *)person{
    [_db open];
    
    [_db executeUpdate:@"UPDATE 'person' SET name = ?  WHERE id = ? ",person.name,person.ID];
    
    [_db executeUpdate:@"UPDATE 'person' SET image = ?  WHERE id = ? ",person.image,person.ID];
    
    [_db executeUpdate:@"UPDATE 'person' SET describe = ?  WHERE id = ? ",person.describe,person.ID];
    
    [_db executeUpdate:@"UPDATE 'person' SET sex = ?  WHERE id = ? ",person.sex,person.ID];

    [_db executeUpdate:@"UPDATE 'person' SET city = ?  WHERE id = ? ",person.city,person.ID];

    [_db executeUpdate:@"UPDATE 'person' SET year = ?  WHERE id = ? ",person.year,person.ID];

    [_db executeUpdate:@"UPDATE 'person' SET month = ?  WHERE id = ? ",person.month,person.ID];

    [_db executeUpdate:@"UPDATE 'person' SET day = ?  WHERE id = ? ",person.day,person.ID];
    
    [_db close];
}

-(NSMutableArray *)getAllperson{
    
    [_db open];
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    FMResultSet *res = [_db executeQuery:@"select * from person where id = 1"];
    
    while ([res next]) {
        Person *person = [[Person alloc] init];
        
        person.ID = @([[res stringForColumn:@"id"] integerValue]);
        
        person.ticketID = @([[res stringForColumn:@"tickes_id"] integerValue]);

        person.image = [res stringForColumn:@"image"];
        
        person.name = [res stringForColumn:@"name"];

        person.describe = [res stringForColumn:@"describe"];
        
        person.sex = @([[res stringForColumn:@"sex"] integerValue]);

        
        person.city = [res stringForColumn:@"city"];
        
        person.year = @([[res stringForColumn:@"year"] integerValue]);

        person.month = @([[res stringForColumn:@"month"] integerValue]);

        person.day = @([[res stringForColumn:@"day"] integerValue]);

        

        //NSLog(@"%@ %@ %@ %@ %@ %@ %@ %@ %@ %@",person.ID,person.ticketID,person.image,person.name,person.describe,person.sex,person.city,person.year,person.month,person.day);
        
        [dataArray addObject:person];
        
    }
    
    [_db close];
    
    return dataArray;

    
}




/**
 *  添加票
 *
 */
- (void)addTicket:(Tickets *)tickets{
    [_db open];
    
    //根据person是否拥有票来添加票
    NSNumber *maxID = @(0);
    
    FMResultSet *res = [_db executeQuery:@"SELECT * FROM Tickes"];
    
    while ([res next]) {
        
        if ([maxID integerValue] < [[res stringForColumn:@"id"] integerValue]) {
            maxID = @([[res stringForColumn:@"id"] integerValue]);
        }
        
    }
    maxID = @([maxID integerValue] + 1);
    
     BOOL c1 = [_db executeUpdate:@"INSERT INTO Tickes(id,movie,cinema,numberTickes,price,roomNumber,pai,zuo)VALUES(?,?,?,?,?,?,?,?)",maxID,tickets.movie,tickets.cinemaName,tickets.numbserTickes,tickets.price,tickets.roomNumber,tickets.pai,tickets.zuo];
    
    if(c1){
        NSLog(@"%@",@"插入成功");
        
        
    } else {
        NSLog(@"%@",@"插入失败");
        
    }
    
    [_db close];
    
}


-(void)updateTicket:(Tickets*)tickets {
    [_db open];
    
    BOOL b = [_db executeUpdate:@"UPDATE 'Tickes' SET movie = ?  WHERE id = ? ",tickets.movie,tickets.own_id];
    
    if (b) {
        NSLog(@"修改成功");
    }
    else {
        NSLog(@"修改失败");
    }
    
    [_db executeUpdate:@"UPDATE 'Tickes' SET cinema = ?  WHERE id = ? ",tickets.cinemaName,tickets.own_id];
    
    [_db executeUpdate:@"UPDATE 'Tickes' SET numberTickes = ?  WHERE id = ? ",tickets.numbserTickes,tickets.own_id];
    
    [_db executeUpdate:@"UPDATE 'Tickes' SET price = ?  WHERE id = ? ",tickets.price,tickets.own_id];
    
    [_db executeUpdate:@"UPDATE 'Tickes' SET roomNumber = ?  WHERE id = ? ",tickets.roomNumber,tickets.own_id];
    
    [_db executeUpdate:@"UPDATE 'Tickes' SET pai = ?  WHERE id = ? ",tickets.pai,tickets.own_id];
    
    [_db executeUpdate:@"UPDATE 'Tickes' SET zuo = ?  WHERE id = ? ",tickets.zuo,tickets.own_id];
    
    [_db close];
}

/**
 *  删除票
 *
 */
- (void)deleteTicket:(Tickets *)tickets{
    [_db open];
    
    
    [_db executeUpdate:@"DELETE FROM Tickes WHERE id = ? ",tickets.own_id];
    
    
    [_db close];
    
}

/**
 *  获取所有票
 *
 */
- (NSMutableArray *)getAllTickets{
    
    [_db open];
    NSMutableArray  *TicketsArray = [[NSMutableArray alloc] init];
    
    FMResultSet *res = [_db executeQuery:[NSString stringWithFormat:@"SELECT * FROM Tickes "]];
    while ([res next]) {
        Tickets *ticket = [[Tickets alloc] init];
        
        ticket.own_id = @([[res stringForColumn:@"id"] integerValue]);
        
        ticket.movie = [res stringForColumn:@"movie"];
        
        ticket.cinemaName = [res stringForColumn:@"cinema"];
        
        ticket.numbserTickes =  [[res stringForColumn:@"numberTickes"] integerValue];
        
        ticket.price = [[res stringForColumn:@"price"] integerValue];
        
        ticket.roomNumber = [[res stringForColumn:@"roomNumber"] integerValue];
        
        ticket.pai = [[res stringForColumn:@"pai"] integerValue];
        
        ticket.zuo = [[res stringForColumn:@"zuo"] integerValue];
        
        [TicketsArray addObject:ticket];
        
    }
    [_db close];
    
    return TicketsArray;
    
}




@end
