//
//  ViewController.h
//  Basics
//
//  Created by Jeanie House on 1/5/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *email;

@property (weak, nonatomic) IBOutlet UITextField *password;


- (IBAction)logText:(id)sender;

- (IBAction)clearText:(id)sender;


@end

