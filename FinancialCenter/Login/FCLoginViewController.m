//
//  FCLoginViewController.m
//  FinancialCenter
//
//  Created by Sivakumar Muniappan on 12/29/14.
//  Copyright (c) 2014 USAA. All rights reserved.
//

#import "FCLoginViewController.h"
#import "FCLocalDataController.h"
#import "FCMemberviewTableViewController.h"
#import "AppDelegate.h"

@interface FCLoginViewController ()

@end

@implementation FCLoginViewController
@synthesize userId,password;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [FCLocalDataController fetchMemberQueueListWithcomplitionHandler:^(NSArray *memberList, NSError *error){
        NSLog(@"member list from server %@", memberList);
    }];
    
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


//Validate username and password based on client requirment


-(Boolean)validateEmail:(NSString *)userid password:(NSString *)password
{
    return true;
    
}

//Login with userid and password need to be implemented

-(Boolean)logInWithUsername:(NSString *)userid password:(NSString *)password
{
    return true;
    
}

- (IBAction)login:(id)sender {
    
    NSString *username=self.userId.text;
    BOOL flag=true;
    
    NSString *passwordGot=self.password.text ;
    

    
    if (username && passwordGot && username.length != 0 && passwordGot.length != 0) {
        //Check username and password validation
        if ([self validateEmail:username password:passwordGot]) {
            
            
        }
        else
        {
            flag=false;
            [[[UIAlertView alloc] initWithTitle:@"User name and passowrd Not Valid"
                                        message:@"Please Enter details!"
                                       delegate:nil
                              cancelButtonTitle:@"ok"
                              otherButtonTitles:nil] show];
        }
        
        // Begin login process
    }
    else
    {
        flag=false;
        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                    message:@"Make sure you fill out all of the information!"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
        // Interrupt login process
    }

    if([self logInWithUsername:username password:passwordGot])
        
    {
        if([username isEqualToString:@"member"])
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UINavigationController *myVC = (UINavigationController *)[storyboard instantiateViewControllerWithIdentifier:@"Waitingtime"];
            
            
           
            [self resignFirstResponder];
            
            [[[[UIApplication sharedApplication] delegate] window] setRootViewController:myVC];
            

        }
        else if ([username isEqualToString:@"floormanager"])
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            FCMemberviewTableViewController *myVC = (FCMemberviewTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"whview"];
            
            
            
            [self resignFirstResponder];
            
            [[[[UIApplication sharedApplication] delegate] window] setRootViewController:myVC];

            
        }
        else{
            //floor manger
         
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UINavigationController *myVC = (UINavigationController *)[storyboard instantiateViewControllerWithIdentifier:@"WealthManagerQueue"];
            
            
            
            [self resignFirstResponder];
            
            [[[[UIApplication sharedApplication] delegate] window] setRootViewController:myVC];

        }
        
    }
}




@end
