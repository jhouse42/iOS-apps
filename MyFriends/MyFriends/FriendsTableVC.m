//
//  FriendsTableVC.m
//  MyFriends
//
//  Created by Jeanie House on 1/22/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "FriendsTableVC.h"
#import <Parse/Parse.h>


@interface FriendsTableVC ()

@end



@implementation FriendsTableVC

{
    NSMutableArray *friends;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    [PFUser currentUser].username = @"Awesome";
    
    [PFUser currentUser].password = @"password";
    
    [[PFUser currentUser] saveInBackground];
    
    friends = [@[] mutableCopy];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)findFriends {
    
    PFQuery *query = [PFUser query];
    
    [query whereKey:@"users" equalTo:@"friends"];
    //NSArray *friends = [query findObjects];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    // Return the number of sections.
//    return friends.count;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    PFObject *friend = friends[indexPath.row];
    PFUser *owner = friend[@"owner"];
    
    cell.textLabel.text = owner.username;
    cell.detailTextLabel.text = friend[@"text"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        PFObject *item = friends[indexPath.row];
        [item deleteInBackground];
        
        [friends removeObjectAtIndex:indexPath.row];
        
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
