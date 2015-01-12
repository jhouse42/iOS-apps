//
//  ViewController.m
//  TicTacToe
//
//  Created by Jeanie House on 1/12/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "ViewController.h"

// Center Squares on View
// Score Label on top that keeps track of wins for each player--two global instance variables that keep track of each players score
// Make buttons change colors instead of title (reset colors when play again)
// Buttons at bottom that resets game scores
//




@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController

{
    int playerTurn;
    
    NSMutableArray *squares;
    
    NSMutableArray *buttons;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    buttons = [@[] mutableCopy];
    
    playerTurn = 1;
    
    squares = [@[
                 @0,@0,@0,
                 @0,@0,@0,
                 @0,@0,@0
                 
                 ] mutableCopy];
    
    
    
    
    int rowCount = 3;
    int ColCount = 3;
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    int buttonCount = 0;
    
    for (int r = 0; r < rowCount; r++) {
        
        //loop per row
        
        for (int c = 0; c < ColCount; c++) {
            
            // loop per coloumn
            
            CGFloat x = c *(width + 10);
            CGFloat y = r *(height + 10);
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
            
            button.backgroundColor = [UIColor blueColor];
            
//            [button setTitle:[NSString stringWithFormat:@"%d",buttonCount] forState:UIControlStateNormal];
            
            button.tag = buttonCount;
            
            [button addTarget:self action:@selector(squareTapped:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:button];
            
            
            [buttons addObject:button];
            
            buttonCount++;
        }
    }
    
    NSLog(@"subviews %@",self.view.subviews);
    
}
             
- (void)squareTapped: (UIButton *)button {
    
    if ([squares[button.tag] intValue] != 0) {
        return;
    }
        
    
    
    squares[button.tag] = @(playerTurn);
    
    [button setTitle:[NSString stringWithFormat:@"%d",playerTurn ] forState:UIControlStateNormal];
    
    playerTurn = (playerTurn ==2) ? 1 : 2;
    
    [self checkForWin];
    
//    NSLog(@"button tapped %d", (int)button.tag);
                 
}

- (void)checkForWin {
    
    NSArray *possibilities = @[
                               // rows
                               @[@0,@1,@2],
                               @[@3,@4,@5],
                               @[@6,@7,@8],
                               
                               // coloumns
                               @[@0,@3,@6],
                               @[@1,@4,@7],
                               @[@2,@5,@8],
                               
                               // diagonals
                               @[@0,@4,@8],
                               @[@2,@4,@6],
                               
                               
                               ];
    
    for (NSArray *possibility in possibilities) {
        
        [self checkPossibility:possibility withPlayer:1];
        [self checkPossibility:possibility withPlayer:2];
       
        
    }
    
}
- (void)checkPossibility:(NSArray *)possibility withPlayer:(int)player {
    
    BOOL playerInSquare1 = ([squares[[possibility[0] intValue]]intValue] ==player);
    BOOL playerInSquare2 = ([squares[[possibility[1] intValue]]intValue] ==player);
    BOOL playerInSquare3 = ([squares[[possibility[2] intValue]]intValue] ==player);
    
    
    if (playerInSquare1 && playerInSquare2 && playerInSquare3) {
        
        
        // player  won
        
       
        
        NSString *message = [NSString stringWithFormat:@"Player %d Won", player];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Winner" message:message delegate:self cancelButtonTitle:@"Play Again Now!" otherButtonTitles:nil];
        
        [alertView show];
        
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // square titles
    for (UIButton *button in buttons) {
        
        
        [button setTitle:@"" forState:UIControlStateNormal];
        
    }
    
    
    playerTurn = 1;
    
    squares = [@[
                 @0,@0,@0,
                 @0,@0,@0,
                 @0,@0,@0
                 
                 ] mutableCopy];
    
    NSLog(@"Play Again");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
