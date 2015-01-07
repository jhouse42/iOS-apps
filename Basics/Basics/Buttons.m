//
//  Buttons.m
//  Basics
//
//  Created by Jeanie House on 1/5/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "Buttons.h"



@interface Buttons ()

@end

@implementation Buttons

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
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



-(IBAction)redButton:(id)sender {
    _mainView.backgroundColor = [UIColor redColor];
    
}

-(IBAction)changeBG:(id)sender {
    UIButton *button = (UIButton *)sender;
    self.mainViewbackground = button.backgroundColor;
}

- (IBAction)blueButton:(id)sender {
    _mainView.backgroundColor = [UIColor blueColor];
}

- (IBAction)orangeButton:(id)sender {
    _mainView.backgroundColor = [UIColor orangeColor];
}

- (IBAction)greenButton:(id)sender {
    _mainView.backgroundColor = [UIColor greenColor];
}

@end
