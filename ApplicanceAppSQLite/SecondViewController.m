//
//  SecondViewController.m
//  ApplicanceAppSQLite
//
//  Created by Mac on 19/07/1938 Saka.
//  Copyright © 1938 Saka Aksh. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveTaskWithSegment {
    
    if (localSegment.selectedSegmentIndex == 0) {
        
        [self saveTask];
        
    }
    else if (localSegment.selectedSegmentIndex == 1){
        
        [self saveTask];
        
    }
    else if (localSegment.selectedSegmentIndex == 2){
        
        [self saveTask];

    }
    
    
}

-(void)saveTask {
    
    NSString *taskFirst = self.textFieldFirst.text;
    
    NSString *taskSecond = self.textFieldSecond.text;
    
    NSString *taskThird = self.textFieldThird.text;

   if (localSegment.selectedSegmentIndex == 0) {
    
    
    if (taskFirst.length > 0) {
        
        if (taskSecond.length > 0) {
            
            if (taskThird.length > 0) {
                
        
        NSString *insertQuery1 = [NSString stringWithFormat:@"INSERT INTO DEVICE_TABLE(DEVICE_ID,DEVICE_NAME,DEVICE_COMPANY,DEVICE_PRICE,DEVICE_TYPE) VALUES('%@','%@','%@','%@','WATCH')",_textFieldFirst.text.uppercaseString,_textFieldFirst.text,_textFieldSecond.text,_textFieldThird.text];
                
                

      NSLog(@"%@",insertQuery1);
       
        int result1 = [[APDatabaseManager sharedManager]executeQuery:insertQuery1];
        
    
        if (result1 == 1) {
            NSLog(@"Successfully inserted Task");
        }
        else {
            NSLog(@"Unable to insert task in SQLite Database");
        }
                
        
        NSLog(@"Task Saved : %@",taskFirst);
        
        self.textFieldFirst.text = @"";
        self.textFieldSecond.text = @"";
        self.textFieldThird.text = @"";

            }
           }
          }
    else {
        NSLog(@"Enter Task First to Save.");
    }

   }
    
    else if (localSegment.selectedSegmentIndex == 1) {
        
        
        if (taskFirst.length > 0) {
            
            if (taskSecond.length > 0) {
                
                if (taskThird.length > 0) {
                    
                    
                    NSString *insertQuery1 = [NSString stringWithFormat:@"INSERT INTO DEVICE_TABLE(DEVICE_ID,DEVICE_NAME,DEVICE_COMPANY,DEVICE_PRICE,DEVICE_TYPE) VALUES('%@','%@','%@','%@','PC')",_textFieldFirst.text.uppercaseString,_textFieldFirst.text,_textFieldSecond.text,_textFieldThird.text];
                    
                    
                    
                    NSLog(@"%@",insertQuery1);
                    
                    int result1 = [[APDatabaseManager sharedManager]executeQuery:insertQuery1];
                    
                    
                    if (result1 == 1) {
                        NSLog(@"Successfully inserted Task");
                    }
                    else {
                        NSLog(@"Unable to insert task in SQLite Database");
                    }
                    
                    
                    NSLog(@"Task Saved : %@",taskFirst);
                    
                    self.textFieldFirst.text = @"";
                    self.textFieldSecond.text = @"";
                    self.textFieldThird.text = @"";
                    
                }
            }
        }
        else {
            NSLog(@"Enter Task First to Save.");
        }
        
    }
    else if (localSegment.selectedSegmentIndex == 2) {
        
        
        if (taskFirst.length > 0) {
            
            if (taskSecond.length > 0) {
                
                if (taskThird.length > 0) {
                    
                    
                    NSString *insertQuery1 = [NSString stringWithFormat:@"INSERT INTO DEVICE_TABLE(DEVICE_ID,DEVICE_NAME,DEVICE_COMPANY,DEVICE_PRICE,DEVICE_TYPE) VALUES('%@','%@','%@','%@','LAPTOP')",_textFieldFirst.text.uppercaseString,_textFieldFirst.text,_textFieldSecond.text,_textFieldThird.text];
                    
                    
                    
                    NSLog(@"%@",insertQuery1);
                    
                    int result1 = [[APDatabaseManager sharedManager]executeQuery:insertQuery1];
                    
                    
                    if (result1 == 1) {
                        NSLog(@"Successfully inserted Task");
                    }
                    else {
                        NSLog(@"Unable to insert task in SQLite Database");
                    }
                    
                    
                    NSLog(@"Task Saved : %@",taskFirst);
                    
                    self.textFieldFirst.text = @"";
                    self.textFieldSecond.text = @"";
                    self.textFieldThird.text = @"";
                    
                }
            }
        }
        else {
            NSLog(@"Enter Task First to Save.");
        }
        
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if (textField == self.textFieldFirst) {
        [self.textFieldSecond resignFirstResponder];
        
    }
    else if (textField == self.textFieldThird) {
        
        [self.textFieldThird resignFirstResponder];
    }
    
    
    return YES;
    
}


- (IBAction)saveAction:(id)sender {

    [self saveTaskWithSegment];

}

- (IBAction)segmentSecond:(id)sender {
    
    localSegment = sender;
    
    if (localSegment.selectedSegmentIndex == 0) {
        
        
        [_textFieldFirst setPlaceholder:@"Enter Model:"];
        
        [_textFieldSecond setPlaceholder:@"Enter Price:"];
        
        [_textFieldThird setPlaceholder:@"Enter Warranty:"];
        
        
        [self saveTask];
    }
    else if (localSegment.selectedSegmentIndex == 1) {
        
        
        [_textFieldFirst setPlaceholder:@"Enter Company:"];
        
        [_textFieldSecond setPlaceholder:@"Enter Price:"];
        
        [_textFieldThird setPlaceholder:@"Enter Warranty:"];
        
        [self saveTask];
    }
    else if (localSegment.selectedSegmentIndex == 2) {
        
        
        
        [_textFieldFirst setPlaceholder:@"Enter Company:"];
        
        [_textFieldSecond setPlaceholder:@"Enter Model:"];
        
        [_textFieldThird setPlaceholder:@"Enter Price:"];

        
        [self saveTask];
    }

    
    
}
@end
