//
//  APDatabaseManager.h
//  ApplicanceAppSQLite
//
//  Created by Mac on 19/07/1938 Saka.
//  Copyright © 1938 Saka Aksh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface APDatabaseManager : NSObject
{
    sqlite3 *myDB;
    
}

+(instancetype) sharedManager;
-(NSString *)getDatabasePath;

-(int)executeQuery:(NSString *)query;

-(NSMutableArray *)getAllTask1;

-(NSMutableArray *)getAllTask2;

-(NSMutableArray *)getAllTask3;



@end
