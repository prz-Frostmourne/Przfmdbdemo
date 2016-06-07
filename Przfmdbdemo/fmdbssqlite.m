//
//  fmdbssqlite.m
//  Przfmdbdemo
//
//  Created by xiantian on 16/1/6.
//  Copyright © 2016年 xiantian. All rights reserved.
//

#import "fmdbssqlite.h"
#import "CheckDB.h"
#import "sqliteusermodel.h"

@implementation fmdbssqlite

//创建表
+ (void)createStuTable
{
    FMDatabase *db =[CheckDB shareDateBase];
    // 1. 打开数据库
    if (![db open]) {
        NSLog(@"Open database failed!");
        return;
    }
    // 2. 编写SQL语句
    NSString *sql = @"create table if not exists Users(phone integer primary key, name text, age integer)";
    // 3. 执行SQL操作
    if ([db executeUpdate:sql]) {
        NSLog(@"Create table sucess!");
    }
    // 4. 关闭数据库
    [db close];
}
//查询单个
+(sqliteusermodel*)queryoneData:(sqliteusermodel *)contact{
    FMDatabase *db = [CheckDB shareDateBase];
    if (![db open]) {
        [db close];
        return nil;
    }
    [db setShouldCacheStatements:YES];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM Users WHERE Users.idField = (?)",contact.idField];

    NSLog(@"%@",contact.idField);
    
     sqliteusermodel *contactee = [[sqliteusermodel alloc]init];
    while ([rs next]) {
        contactee.address = [rs stringForColumn:@"address"];
        contactee.cName = [rs stringForColumn:@"cName"];
        contactee.canId = [rs stringForColumn:@"canId"];
        contactee.email = [rs stringForColumn:@"email"];
        contactee.entryTime = [rs stringForColumn:@"entryTime"];
        contactee.headimg = [rs stringForColumn:@"headimg"];
        contactee.idField = [rs stringForColumn:@"idField"];
        contactee.identity = [rs stringForColumn:@"identity"];
        contactee.insertTime = [rs stringForColumn:@"insertTime"];
        contactee.isAdmin = [rs stringForColumn:@"isAdmin"];
        contactee.jobnum = [rs stringForColumn:@"jobnum"];
        contactee.numId = [rs stringForColumn:@"numId"];
        contactee.phone = [rs stringForColumn:@"phone"];
        contactee.picen = [rs stringForColumn:@"picen"];
        contactee.position = [rs stringForColumn:@"position"];
        contactee.qq = [rs stringForColumn:@"qq"];
        contactee.qrcode = [rs stringForColumn:@"qrcode"];
        contactee.sector = [rs stringForColumn:@"sector"];
        contactee.sex = [rs stringForColumn:@"sex"];
        contactee.status = [rs stringForColumn:@"status"];
        contactee.token = [rs stringForColumn:@"token"];
        contactee.updataTime = [rs stringForColumn:@"updataTime"];
        contactee.userId = [rs stringForColumn:@"userId"];
        contactee.userInfo = [rs stringForColumn:@"userInfo"];
        contactee.username = [rs stringForColumn:@"username"];
        contactee.blackimage = [rs stringForColumn:@"blackimage"];
     }
    [rs close];
    [db close];
    return contactee;
}

//查询全部

+(NSMutableArray *)queryData{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    FMDatabase *db = [CheckDB shareDateBase];
    if (![db open]) {
        [db close];
        return nil;
    }
    //    [db open];
    [db setShouldCacheStatements:YES];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM Users"];
    while ([rs next]) {
        sqliteusermodel *contact = [[sqliteusermodel alloc]init];
        contact.address = [rs stringForColumn:@"address"];
        contact.cName = [rs stringForColumn:@"cName"];
        contact.canId = [rs stringForColumn:@"canId"];
        contact.email = [rs stringForColumn:@"email"];
        contact.entryTime = [rs stringForColumn:@"entryTime"];
        contact.headimg = [rs stringForColumn:@"headimg"];
        contact.idField = [rs stringForColumn:@"idField"];
        contact.identity = [rs stringForColumn:@"identity"];
        contact.insertTime = [rs stringForColumn:@"insertTime"];
        contact.isAdmin = [rs stringForColumn:@"isAdmin"];
        contact.jobnum = [rs stringForColumn:@"jobnum"];
        contact.numId = [rs stringForColumn:@"numId"];
        contact.phone = [rs stringForColumn:@"phone"];
        contact.picen = [rs stringForColumn:@"picen"];
        contact.position = [rs stringForColumn:@"position"];
        contact.qq = [rs stringForColumn:@"qq"];
        contact.qrcode = [rs stringForColumn:@"qrcode"];
        contact.sector = [rs stringForColumn:@"sector"];
        contact.sex = [rs stringForColumn:@"sex"];
        contact.status = [rs stringForColumn:@"status"];
        contact.token = [rs stringForColumn:@"token"];
        contact.updataTime = [rs stringForColumn:@"updataTime"];
        contact.userId = [rs stringForColumn:@"userId"];
        contact.userInfo = [rs stringForColumn:@"userInfo"];
        contact.username = [rs stringForColumn:@"username"];
        contact.blackimage = [rs stringForColumn:@"blackimage"];
        [array addObject:contact];
    }
    [rs close];
    [db close];
    return array;

}

//增加
+(BOOL)insertData:(sqliteusermodel*)contact{
    BOOL result = NO;
    FMDatabase *db = [CheckDB shareDateBase];
    if (![db open]) {
        [db close];
        return NO;
    }
//    [db open];
    
    [db setShouldCacheStatements:YES];
    if ([db tableExists:@"Users"]) {
        result = YES;
    }else{
        if ([db executeUpdate:@"create table if not exists Users(idField text primary key, name text, address text, cName text, canId text, email text, entryTime text, headimg text, identity text, insertTime text, isAdmin text, jobnum text, numId text, phone text, picen text, position text, qq text, qrcode text, sector text, sex text, status text, token text, updataTime text, userId text, userInfo text, username text, blackimage text)"]) {
            result = YES;
        }
    }
    if ([db executeUpdate:@"INSERT INTO Users(address,cName,canId,email,entryTime,headimg,idField,identity,insertTime,isAdmin,jobnum,numId,phone,picen,position,qq,qrcode,sector,sex,status,token,updataTime,userId,userInfo,username,blackimage) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",contact.address,contact.cName,contact.canId,contact.email,contact.entryTime,contact.headimg,contact.idField,contact.identity,contact.insertTime,contact.isAdmin,contact.jobnum,contact.numId,contact.phone,contact.picen,contact.position,contact.qq,contact.qrcode,contact.sector,contact.sex,contact.status,contact.token,contact.updataTime,contact.userId,contact.userInfo,contact.username,contact.blackimage]) {
        result = YES;
    }
    [db close];
    return result;
}

//删除
+(BOOL)deleteData:(sqliteusermodel *)contactID{
    BOOL result = NO;
    FMDatabase *db = [CheckDB shareDateBase];
    if (![db open]) {
        [db close];
        return NO;
    }
//    [db open];
    [db setShouldCacheStatements:YES];
    if ([db executeUpdate:@"DELETE FROM Users WHERE Users.idField= (?)",contactID.idField  ]) {
        result = YES;
    }
    [db close];
    return result;
}

//修改
+(BOOL)updateData:(sqliteusermodel*)contact{
    BOOL result = NO;
    FMDatabase *db = [CheckDB shareDateBase];
    if (![db open]) {
        [db close];
        return NO;
    }
    [db setShouldCacheStatements:YES];
    if ([db executeUpdate:@"UPDATE Users SET phone = (?) WHERE idField = (?)",contact.username,contact.idField]) {
        result = YES;
    }
    [db close];
    return result;
}

@end
