//
//  FCAssignTableViewController.m
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 1/2/15.
//  Copyright (c) 2015 USAA. All rights reserved.
//

#import "FCAssignTableViewController.h"
#import "FCAssignTableViewCell.h"
#import "FCAddViewController.h"

@interface FCAssignTableViewController ()

@end

@implementation FCAssignTableViewController
@synthesize name,eagleId;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.name =  [[NSMutableArray alloc] init];
    
       [self.name addObject:@"John Miller"];
    [self.name addObject:@"David johson"];
    [self.name addObject:@"Rebbaca black"];
    
     self.eagleId =  [[NSMutableArray alloc] init];
    [self.eagleId addObject:@"PL0132"];
    [self.eagleId addObject:@"PL0122"];
    [self.eagleId addObject:@"PL012"];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.name.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FCAssignTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wealthmanager" forIndexPath:indexPath];
    if(cell==nil)
    {
        FCAssignTableViewCell *cell=[[FCAssignTableViewCell alloc]init];
    }
    
    NSLog([self.name objectAtIndex:indexPath.row]);
    cell.name.text=[self.name objectAtIndex:indexPath.row];
    cell.eaid.text=[self.eagleId objectAtIndex:indexPath.row];

    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
     //Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.name removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
       FCAddViewController *add = segue.destinationViewController;
    add.agentName=self.name;
    add.agentId=self.eagleId;
}


         - (IBAction)isActive:(id)sender {
             CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
             NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
             
             FCAssignTableViewCell *cell= (FCAssignTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath ];
             UISegmentedControl *segmentedControl = (UISegmentedControl *)cell.activeInactive;
             NSString *isActive = [segmentedControl titleForSegmentAtIndex: [segmentedControl selectedSegmentIndex]];
             if([isActive isEqualToString:@"Active"])
             {
                 cell.name.textColor= [UIColor colorWithRed:46/255.0
                                                                       green:204/255.0
                                                                        blue:113/255.0
                                                                       alpha:1];;
             }
             else
             {
                cell.name.textColor=[UIColor redColor];
             }
             
            
            

         }
@end
