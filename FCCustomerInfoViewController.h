//
//  FCCustomerInfoViewController.h
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 1/11/15.
//  Copyright (c) 2015 USAA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCCustomerInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *reason;
- (IBAction)finished:(id)sender;
@property  int  selectedCell;
@property (nonatomic,strong) NSMutableArray *results;

@end
