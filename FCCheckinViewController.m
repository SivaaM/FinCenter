//
//  FCCheckinViewController.m
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 1/2/15.
//  Copyright (c) 2015 USAA. All rights reserved.
//

#import "FCCheckinViewController.h"
#import "FCLocalDataController.h"

@interface FCCheckinViewController ()
@property (nonatomic,strong) NSMutableArray *results;
@property (nonatomic,strong) NSArray *reasonForVisit;
@end

@implementation FCCheckinViewController
@synthesize results;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerview.dataSource = self;
    self.pickerview.delegate = self;
      self.reasonForVisit  = [[NSArray alloc]         initWithObjects:@"Life Insurance",@"Non-Life Insurance",@"Banking",@"Loans",@"Investments",@"Retirement",@"Advice" , nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return 7;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    
    return [self.reasonForVisit objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    self.reason.text=[self.reasonForVisit objectAtIndex:row];
    
    
}
- (IBAction)clear:(id)sender {
    
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)view;
            textField.text = nil;
        }
    }

}

- (IBAction)checkin:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"checked in"
                                message:@"User has been checked in"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)view;
            textField.text = nil;
        }
    }
   
    
          
}
@end
