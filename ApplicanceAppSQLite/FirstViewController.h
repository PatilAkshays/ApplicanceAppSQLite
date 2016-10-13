//
//  FirstViewController.h
//  ApplicanceAppSQLite
//
//  Created by Mac on 19/07/1938 Saka.
//  Copyright © 1938 Saka Aksh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APDatabaseManager.h"
#import "CustomTableViewCell.h"

@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *watchArray;
    NSMutableArray *pcArray;
    NSMutableArray *lapTopArray;
    
    UISegmentedControl *localSegment;
}

@property (strong, nonatomic) IBOutlet UITableView *tabelView;

- (IBAction)segmentFirst:(id)sender;

@end

