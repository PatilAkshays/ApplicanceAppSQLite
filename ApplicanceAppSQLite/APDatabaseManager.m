//
//  APDatabaseManager.m
//  ApplicanceAppSQLite
//
//  Created by Mac on 19/07/1938 Saka.
//  Copyright © 1938 Saka Aksh. All rights reserved.
//

#import "APDatabaseManager.h"


@implementation APDatabaseManager

+(instancetype)sharedManager {
    
    static APDatabaseManager *sharedInstance;
    
    if (sharedInstance == nil) {
        sharedInstance = [[APDatabaseManager alloc]init];
    }
    
    return sharedInstance;
    
}

-(NSString *)getDatabasePath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DatabaseFile.sqlite"];
}


-(int)executeQuery:(NSString *)query {
    
    int success = 0;
    sqlite3_stmt *statement;
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                success = 1;
            }
        }
        
        sqlite3_close(myDB);
    }
    
    
    
    return success;
    
}

-(NSMutableArray *)getAllTaskWatch {
    
    
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT * FROM DEVICE_TABLE WHERE DEVICE_TYPE = 'WATCH'";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, nil) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char * taskString = (const char *)sqlite3_column_text(statement, 0);
                const char * modelString = (const char *)sqlite3_column_text(statement, 1);
                const char * priceString = (const char *)sqlite3_column_text(statement, 2);
                const char * yearString = (const char *)sqlite3_column_text(statement, 3);
                const char * deviceType = (const char *)sqlite3_column_text(statement, 4);

                
                NSString *taskID = [NSString stringWithUTF8String:taskString];
                
                NSString *model = [NSString stringWithUTF8String:modelString];
                
                NSString *price = [NSString stringWithUTF8String:priceString];
                NSString *year = [NSString stringWithUTF8String:yearString];
               
                NSString *deviceTypes = [NSString stringWithUTF8String:deviceType];

                
                NSDictionary *watchDic = [[NSDictionary alloc]initWithObjects:@[taskID,model,price,year,deviceTypes] forKeys:@[@"watch_id",@"model",@"price",@"year",@"WATCH"]];
                
                
                
                [mArray addObject:watchDic];
                
                NSLog(@"%@",mArray);
                
            }
            
        }
        
        sqlite3_close(myDB);
    }

    return mArray;
    
    
    
}
-(NSMutableArray *)getAllTaskPc {
    
    
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT * FROM DEVICE_TABLE WHERE DEVICE_TYPE = 'PC'";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, nil) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char * taskString = (const char *)sqlite3_column_text(statement, 0);
                const char * companyString = (const char *)sqlite3_column_text(statement, 1);
                const char * priceString = (const char *)sqlite3_column_text(statement, 2);
                const char * yearString = (const char *)sqlite3_column_text(statement, 3);
                const char * deviceType = (const char *)sqlite3_column_text(statement, 4);
                

                
                NSString *taskID = [NSString stringWithUTF8String:taskString];
                
                NSString *company = [NSString stringWithUTF8String:companyString];
                
                NSString *price = [NSString stringWithUTF8String:priceString];
                NSString *year = [NSString stringWithUTF8String:yearString];
                NSString *deviceTypes = [NSString stringWithUTF8String:deviceType];
                
                NSDictionary *pcDic = [[NSDictionary alloc]initWithObjects:@[taskID,company,price,year,deviceTypes] forKeys:@[@"pc_id",@"company",@"price",@"year",@"PC"]];
                
                
                
                [mArray addObject:pcDic];

                
                NSLog(@"%@",mArray);

            }
            
        }
        
        sqlite3_close(myDB);
    }
    
    return mArray;
    
}

-(NSMutableArray *)getAllTaskLapTop {
    
    
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT * FROM DEVICE_TABLE WHERE DEVICE_TYPE = 'LAPTOP'";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, nil) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char * taskString = (const char *)sqlite3_column_text(statement, 0);
                const char * companyString = (const char *)sqlite3_column_text(statement, 1);
                const char * modelString = (const char *)sqlite3_column_text(statement, 2);
                const char * yearString = (const char *)sqlite3_column_text(statement, 3);
                const char * deviceType = (const char *)sqlite3_column_text(statement, 4);

                
                NSString *taskID = [NSString stringWithUTF8String:taskString];
                
                NSString *company = [NSString stringWithUTF8String:companyString];
                
                NSString *price = [NSString stringWithUTF8String:modelString];
                NSString *year = [NSString stringWithUTF8String:yearString];
                NSString *deviceTypes = [NSString stringWithUTF8String:deviceType];

                
                NSDictionary *lapTopDic = [[NSDictionary alloc]initWithObjects:@[taskID,company,price,year,deviceTypes] forKeys:@[@"lapTop_id",@"company",@"model",@"year",@"LAPTOP"]];
                
                
                
                [mArray addObject:lapTopDic];
                
                
                NSLog(@"%@",mArray);
                
                
            }
            
        }
        
        sqlite3_close(myDB);
    }
   
    return mArray;
    
}



@end
