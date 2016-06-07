//
//  CheckDB.m
//  Przfmdbdemo
//
//  Created by xiantian on 16/1/6.
//  Copyright © 2016年 xiantian. All rights reserved.
//

#import "CheckDB.h"
#define kDatabaseName @"Documents/HAOBAN.db"
@implementation CheckDB

+(FMDatabase*)shareDateBase{
    static FMDatabase *db = nil;
    if (db == nil) {
        db = [[FMDatabase alloc]initWithPath:[NSHomeDirectory() stringByAppendingPathComponent:kDatabaseName]];
    }
    return db;
}
@end
