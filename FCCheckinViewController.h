//
//  FCCheckinViewController.h
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 1/2/15.
//  Copyright (c) 2015 USAA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCCheckinViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

- (IBAction)dateactive:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *amPm;

- (IBAction)clear:(id)sender;
- (IBAction)checkin:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerview;
@property (weak, nonatomic) IBOutlet UITextField *datefield;

@property (weak, nonatomic) IBOutlet UISwitch *sw;
@property (weak, nonatomic) IBOutlet UILabel *reason;

@end
