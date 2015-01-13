//
//  FCAddViewController.m
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 1/2/15.
//  Copyright (c) 2015 USAA. All rights reserved.
//

#import "FCAddViewController.h"

@interface FCAddViewController ()

@end

@implementation FCAddViewController
@synthesize agentName,first,middle,last,agentId;
- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)add:(id)sender {
    NSString *fullname=[NSString stringWithFormat:@"%@ %@ %@",self.first.text, self.middle.text, self.last.text];
    [agentName addObject:fullname];
    [agentId addObject:self.idGot.text];
    [self.navigationController popViewControllerAnimated:YES];
    
     }
@end
