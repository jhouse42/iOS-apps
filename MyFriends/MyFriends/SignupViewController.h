//
//  SignupViewController.h
//  Frinder
//
//  Created by Jeanie House on 11/6/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)signup:(id)sender;

@end
