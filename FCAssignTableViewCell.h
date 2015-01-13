//
//  FCAssignTableViewCell.h
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 1/2/15.
//  Copyright (c) 2015 USAA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCAssignTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UISegmentedControl *activeInactive;
@property (weak, nonatomic) IBOutlet UILabel *eaid;



@end
