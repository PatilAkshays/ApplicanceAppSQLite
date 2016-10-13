//
//  SecondViewController.h
//  ApplicanceAppSQLite
//
//  Created by Mac on 19/07/1938 Saka.
//  Copyright © 1938 Saka Aksh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APDatabaseManager.h"

@interface SecondViewController : UIViewController<UITextFieldDelegate>
{
    UISegmentedControl *localSegment;
}


@property (strong, nonatomic) IBOutlet UITextField *textFieldFirst;

@property (strong, nonatomic) IBOutlet UITextField *textFieldSecond;

@property (strong, nonatomic) IBOutlet UITextField *textFieldThird;

- (IBAction)saveAction:(id)sender;


- (IBAction)segmentSecond:(id)sender;


@end

