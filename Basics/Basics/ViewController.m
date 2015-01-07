//
//  ViewController.m
//  Basics
//
//  Created by Jeanie House on 1/5/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "ViewController.h"

// HOMEWORK

// Create 2 View Controllers on the main storyboard

//  View Controller 1
// - 2 buttons (one will clear textfields, one will log all text fields) (print)

// - 3 textfields (username, email, password
// - password field should look like the one by hiding the text with dots (look in right panel)
// - email field should use email keyboard (also in right panel)
// View Controller 2

// - 4 buttons with different color backgrounds
// - each button changes the main view controllers background color


// add constaints
// make the buttons on view controller 2 circles with no text

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logText:(id)sender {

    NSLog(@"%@", self.username.text);
    NSLog(@"%@", self.email.text);
    NSLog(@"%@", self.password.text);
}

- (IBAction)clearText:(id)sender {
    
    self.username.text = @"";
    self.email.text = @"";
    self.password.text = @"";
}



@end
