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
        
        watchArray = [[APDatabaseManager sharedManager]getAllTask1];
        [self.tabelView reloadData];
        
        

    }
    else if (localSegment.selectedSegmentIndex == 1){
        
        pcArray = [[APDatabaseManager sharedManager]getAllTask2];
        [self.tabelView reloadData];

    }
    else if (localSegment.selectedSegmentIndex == 2){

    lapTopArray = [[APDatabaseManager sharedManager]getAllTask3];

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
        

      cell.labelFirst.text = [watchArray objectAtIndex:indexPath.row];
    
      cell.labelSecond.text = [watchArray objectAtIndex:indexPath.row];

      cell.labelThird.text = [watchArray objectAtIndex:indexPath.row];
       
        
        NSLog(@"%@",watchArray);
    }
    else if(localSegment.selectedSegmentIndex ==  1){

        cell.labelFirst.text = [pcArray objectAtIndex:indexPath.row];
        
        cell.labelSecond.text = [pcArray objectAtIndex:indexPath.row];
        
        cell.labelThird.text = [pcArray objectAtIndex:indexPath.row];

    }
    else if(localSegment.selectedSegmentIndex ==  2){
        
        cell.labelFirst.text = [lapTopArray objectAtIndex:indexPath.row];
        
        cell.labelSecond.text = [lapTopArray objectAtIndex:indexPath.row];
        
        cell.labelThird.text = [lapTopArray objectAtIndex:indexPath.row];
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
   // NSLog(@"Delete");
    
    if (localSegment.selectedSegmentIndex == 0) {

    NSString *task = [watchArray objectAtIndex:indexPath.row];
    
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM TASK_TABLE WHERE TASK_ID = '%@'",task.uppercaseString];
    
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
        
        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM TASK_TABLE WHERE TASK_ID = '%@'",task.uppercaseString];
        
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
        
        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM TASK_TABLE WHERE TASK_ID = '%@'",task.uppercaseString];
        
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
