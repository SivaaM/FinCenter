//
//  FCAddViewController.h
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 1/2/15.
//  Copyright (c) 2015 USAA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCAddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *first;
@property (weak, nonatomic) IBOutlet UITextField *middle;
@property (weak, nonatomic) IBOutlet UITextField *last;

@property (weak, nonatomic) IBOutlet UITextField *idGot;

- (IBAction)add:(id)sender;
@property(strong,nonatomic) NSMutableArray* agentName;
@property(strong,nonatomic) NSMutableArray* agentId;


@end
