//
//  FCMemberview.m
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 12/30/14.
//  Copyright (c) 2014 USAA. All rights reserved.
//

#import "FCMemberviewTableViewController.h"
#import "FCLocalDataController.h"
#import "FCMemberTableViewCell.h"

@interface FCMemberviewTableViewController ()
@property (nonatomic,strong) NSArray *results;
@end

@implementation FCMemberviewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [FCLocalDataController fetchMemberQueueListWithcomplitionHandler:^(NSArray *memberList, NSError *error){
        self.results=memberList;
        
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

// Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    
    return   self.results.count;
    }

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *CellIdentifier = @"headercell";
    return [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Displaycell";
    FCMemberTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell=[[FCMemberTableViewCell alloc] init];
        
        
    }
    
    NSDictionary *member = (self.results)[indexPath.row];
   
    
    cell.sno.text=member[@"serialNo"];
    cell.name.text=member[@"memberName"];
    cell.appointment.text=member[@"hasAppointment"];
    cell.status.text=member[@"status"];
     NSDateFormatter *time = [[NSDateFormatter alloc] init];
    [time setDateFormat:@"yyyy.MM.dd G 'at' HH:mm:ss"];
    NSDate *Date = [time dateFromString:member[@"checkInTime"]];
    NSString *dateString = [NSDateFormatter localizedStringFromDate:Date
                                                          dateStyle:NSDateFormatterNoStyle
                                                          timeStyle:NSDateFormatterShortStyle];
    
    cell.time.text=dateString;

    
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}
- (BOOL)allowsHeaderViewsToFloat{
    return YES;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
