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


@interface FriendDetailVC () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation FriendDetailVC
{
    NSArray *repos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSString *username = self.friendInfo[@"login"];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", username];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    repos = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, 320, 368)];
    
    tableview.delegate = self;
    tableview.dataSource = self;
    
    [self.view addSubview:tableview];
    
//    NSLog(@"%@",repos);

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return repos.count;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    
    
    cell.textLabel.text = repos[indexPath.row][@"name"];
    
    if (repos[indexPath.row][@"description"]== [NSNull null]) {
    }else{
    
    cell.detailTextLabel.text = repos[indexPath.row][@"description"];
    
    }
    return cell;
    
    
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
