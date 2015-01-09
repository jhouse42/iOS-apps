//
//  FriendDetailVC.m
//  GithubFriends
//
//  Created by Jeanie House on 1/8/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "FriendDetailVC.h"


// Add property to this class .h called "friendInfo"

// grab the request code from newfriendVC.m

// change the url to https://api.github.com/users/USERNAME/repos

// make the USERNAME dynamic based on friendInfo[@"login"]

// the return will be an nsarray of repos

// log the repos array


// extra

// make selecting a cell push to friendDetailVC
// and set friendInfo based on cell selected


@interface FriendDetailVC ()

@end

@implementation FriendDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    
    
    
    
    NSString *username = self.friendInfo[@"login"];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", username];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *repos = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",repos);

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

@end
