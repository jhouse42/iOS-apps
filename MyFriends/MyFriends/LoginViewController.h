//
//  LoginViewController.h
//  Frinder
//
//  Created by Jeanie House on 11/6/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;

@end
