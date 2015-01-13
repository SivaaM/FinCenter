//
//  FCAssignTableViewController.h
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 1/2/15.
//  Copyright (c) 2015 USAA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCAssignTableViewController : UITableViewController
@property(strong,nonatomic) NSMutableArray* name;
@property(strong,nonatomic) NSMutableArray* eagleId;
- (IBAction)isActive:(id)sender;



@end
