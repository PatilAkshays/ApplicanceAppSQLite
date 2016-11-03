//
//  FirstViewController.m
//  ApplicanceAppSQLite
//
//  Created by Mac on 19/07/1938 Saka.
//  Copyright © 1938 Saka Aksh. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    watchArray = [[NSMutableArray alloc]init];

    pcArray = [[NSMutableArray alloc]init];

    lapTopArray = [[NSMutableArray alloc]init];

    [self.tabelView reloadData];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated {
    
    [self reloadTask];
}

-(void)reloadTask {
    if (localSegment.selectedSegmentIndex == 0) {
        
        watchArray = [[APDatabaseManager sharedManager]getAllTaskWatch];
        [self.tabelView reloadData];
        
        NSLog(@"%@",watchArray);

    }
    else if (localSegment.selectedSegmentIndex == 1){
        
        pcArray = [[APDatabaseManager sharedManager]getAllTaskPc];
        [self.tabelView reloadData];

    }
    else if (localSegment.selectedSegmentIndex == 2){

    lapTopArray = [[APDatabaseManager sharedManager]getAllTaskLapTop];

    [self.tabelView reloadData];
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (localSegment.selectedSegmentIndex == 0) {
        return watchArray.count;
        
        
    }
    else if (localSegment.selectedSegmentIndex == 1){
        return pcArray.count;
    }
    
    else if (localSegment.selectedSegmentIndex == 2){
        return lapTopArray.count;
    }
  
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   // UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Device_cell"];
    
    if (localSegment.selectedSegmentIndex == 0) {
        

        NSDictionary *watchData = [watchArray objectAtIndex:indexPath.row];
        
       // NSLog(@"%@",watchData);
        
        
      cell.labelFirst.text = [watchData valueForKey:@"model"];
    
      cell.labelSecond.text = [watchData valueForKey:@"price"];

      cell.labelThird.text = [watchData valueForKey:@"year"];
       
//        NSLog(@"%@",cell.labelFirst.text);
//        NSLog(@"%@",cell.labelSecond.text);
//        NSLog(@"%@",cell.labelThird.text);
        
        

//        NSLog(@"%@",watchArray);
    }
    else if(localSegment.selectedSegmentIndex ==  1){

        NSDictionary *pcData = [pcArray objectAtIndex:indexPath.row];
        
       // NSLog(@"%@",pcData);
        
        
        cell.labelFirst.text = [pcData valueForKey:@"company"];
        
        cell.labelSecond.text = [pcData valueForKey:@"price"];
        
        cell.labelThird.text = [pcData valueForKey:@"year"];
        
           }
    else if(localSegment.selectedSegmentIndex ==  2){
        
        NSDictionary *lapTopData = [lapTopArray objectAtIndex:indexPath.row];
        
       // NSLog(@"%@",lapTopData);
        
        
        cell.labelFirst.text = [lapTopData valueForKey:@"company"];
        
        cell.labelSecond.text = [lapTopData valueForKey:@"model"];
        
        cell.labelThird.text = [lapTopData valueForKey:@"year"];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
   // NSLog(@"Delete");
    
    if (localSegment.selectedSegmentIndex == 0) {

    NSString *task = [watchArray objectAtIndex:indexPath.row];
    
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",[task valueForKey:@"watch_id"]];
    
    if ([[APDatabaseManager sharedManager]executeQuery:deleteQuery] == 1) {
        NSLog(@"Successfully Deleted");
        [self reloadTask];
    }
    else {
        NSLog(@"Failed to Delete Task.");
        
    }
  }
   else if (localSegment.selectedSegmentIndex == 1) {
        
        NSString *task = [pcArray objectAtIndex:indexPath.row];
        
        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",[task valueForKey:@"pc_id"]];
        
        if ([[APDatabaseManager sharedManager]executeQuery:deleteQuery] == 1) {
            NSLog(@"Successfully Deleted");
            [self reloadTask];
        }
        else {
            NSLog(@"Failed to Delete Task.");
            
        }
    }
    else if (localSegment.selectedSegmentIndex == 2) {
        
        NSString *task = [lapTopArray objectAtIndex:indexPath.row];
        
        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",[task valueForKey:@"lapTop_id"]];
        
        if ([[APDatabaseManager sharedManager]executeQuery:deleteQuery] == 1) {
            NSLog(@"Successfully Deleted");
            [self reloadTask];
        }
        else {
            NSLog(@"Failed to Delete Task.");
            
        }
    }

    
    
}


- (IBAction)segmentFirst:(id)sender {
    
    localSegment = sender;
    if (localSegment.selectedSegmentIndex == 0) {
        
        [self.tabelView reloadData];
    }
    else if (localSegment.selectedSegmentIndex == 1){
        
        [self.tabelView reloadData];
        
    }
    else if (localSegment.selectedSegmentIndex == 2){
        [self.tabelView reloadData];
    }
    
}
@end
