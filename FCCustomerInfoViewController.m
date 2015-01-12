//
//  FCCustomerInfoViewController.m
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 1/11/15.
//  Copyright (c) 2015 USAA. All rights reserved.
//

#import "FCCustomerInfoViewController.h"
#import "FCLocalDataController.h"

@interface FCCustomerInfoViewController ()

@end

@implementation FCCustomerInfoViewController
@synthesize results;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSDictionary *member = (self.results)[self.selectedCell];
 

    self.name.text=member[@"memberName"];
    self.reason.text=member[@"reason"];

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)finished:(id)sender {
    [self.results removeObjectAtIndex:self.selectedCell];
    [self.navigationController popViewControllerAnimated:YES];

}
@end
