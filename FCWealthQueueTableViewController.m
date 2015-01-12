//
//  WealthQueueTableViewController.m
//  FinancialCenter
//
//  Created by Aravind Thiyagarajan on 1/11/15.
//  Copyright (c) 2015 USAA. All rights reserved.
//

#import "FCWealthQueueTableViewController.h"
#import "FCLocalDataController.h"
#import "FCAssignTableViewCell.h"
#import "FCCustomerInfoViewController.h"

@interface FCWealthQueueTableViewController ()
@property (nonatomic,strong) NSMutableArray *results;
@end

@implementation FCWealthQueueTableViewController
@synthesize results;
- (void)viewDidLoad {
    [super viewDidLoad];
    [FCLocalDataController fetchMemberQueueListWithcomplitionHandler:^(NSArray *memberList, NSError *error){
        self.results=[NSMutableArray arrayWithArray:memberList];
        
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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
    return self.results.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FCAssignTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wealthmanager" forIndexPath:indexPath];
    if(cell==nil)
    {
        FCAssignTableViewCell *cell=[[FCAssignTableViewCell alloc]init];
    }
    NSDictionary *member = (self.results)[indexPath.row];
    cell.name.text=member[@"memberName"];
    
    return cell;
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



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    FCCustomerInfoViewController *info = segue.destinationViewController;
    info.selectedCell=indexPath.row;
    info.results=self.results;
}


@end
