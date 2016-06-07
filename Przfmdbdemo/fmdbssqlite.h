//
//  fmdbssqlite.h
//  Przfmdbdemo
//
//  Created by xiantian on 16/1/6.
//  Copyright © 2016年 xiantian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "sqliteusermodel.h"
@interface fmdbssqlite : NSObject
@property (nonatomic, strong) FMDatabase *database;
@property (nonatomic, strong) NSMutableArray *students;

+(void)createStuTable;

+(sqliteusermodel*)queryoneData:(sqliteusermodel*)contact;

+(NSMutableArray*)queryData;

+(BOOL)insertData:(sqliteusermodel*)contact;

+(BOOL)deleteData:(sqliteusermodel *)contactID;

+(BOOL)updateData:(sqliteusermodel*)contact;
@end
