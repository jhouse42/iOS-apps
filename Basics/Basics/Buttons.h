//
//  Buttons.h
//  Basics
//
//  Created by Jeanie House on 1/5/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface Buttons : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *orangeButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;

@property (strong, nonatomic) IBOutlet UIView *mainView;






- (IBAction)redButton:(id)sender;
- (IBAction)blueButton:(id)sender;
- (IBAction)orangeButton:(id)sender;
- (IBAction)greenButton:(id)sender;



@end
