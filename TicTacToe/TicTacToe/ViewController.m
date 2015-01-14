//
//  ViewController.m
//  TicTacToe
//
//  Created by Jeanie House on 1/12/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

// Center Squares on View
// Make buttons change colors instead of title (reset colors when play again)
// Score Label on top that keeps track of wins for each player--two global instance variables that keep track of each players score
// Button at bottom that resets game scores
//




@interface ViewController () <UIAlertViewDelegate>

@property (nonatomic) int player1Score;
@property (nonatomic) int player2Score;

@end

@implementation ViewController

{
    int playerTurn;
    
    NSMutableArray *squares;
    
    NSMutableArray *buttons;
    
   // int player1Score;
   // int player2Score;
    
    UILabel *score1Label;
    UILabel *score2Label;
    
    NSArray *playerColors;
    
}

// Setter method
- (void)setPlayer1Score:(int)player1Score {
    score1Label.text = [NSString stringWithFormat:@"Player1 : %d", player1Score];
    _player1Score = player1Score;
    

}

// Setter method
- (void)setPlayer2Score:(int)player2Score {
    score2Label.text = [NSString stringWithFormat:@"Player2 : %d", player2Score];
    _player2Score = player2Score;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    playerColors = @[[UIColor lightGrayColor],[UIColor magentaColor], [UIColor cyanColor]];
    
    score1Label = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 150, 50)];
//    score1Label.text = [NSString stringWithFormat:@"Player 1:%d", self.player1Score];
    [self.view addSubview:score1Label];
    score1Label.backgroundColor = [UIColor yellowColor];
    score1Label.alpha = 0.6;
    
    
    score2Label = [[UILabel alloc]initWithFrame:CGRectMake(210, 20, 150, 50)];
//    score2Label.text = [NSString stringWithFormat:@"Player 2:%d", self.player2Score];
    [self.view addSubview:score2Label];
    score2Label.backgroundColor = [UIColor yellowColor];
    score2Label.alpha = 0.6;
    
    
    UIButton *resetButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 500, 150, 50)];
    //[self.view addSubview:resetButton];
    resetButton.backgroundColor = [UIColor blueColor];
    
    [resetButton setTitle:@"Reset Game" forState:UIControlStateNormal];
     //[resetButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:resetButton];
    [resetButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    
    resetButton.alpha = 0.6;
  //  resetButton.layer.cornerRadius = height / 2;
    
    self.player1Score = 0;
    self.player2Score = 0;
    
    buttons = [@[] mutableCopy];
    
    playerTurn = 1;
    
    squares = [@[
                 @0,@0,@0,
                 @0,@0,@0,
                 @0,@0,@0
                 
                 ] mutableCopy];
    
    
    
    
    int rowCount = 3;
    int colCount = 3;
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGFloat padding = 2;
    
    CGFloat fullWidth = (colCount * width) + (colCount - 1) * padding;
    CGFloat fullHeight = (rowCount * height) + (rowCount - 1) * padding;
    
    int buttonCount = 0;
    
    for (int r = 0; r < rowCount; r++) {
        
        //loop per row
        
        for (int c = 0; c < colCount; c++) {
            
            // loop per coloumn
            
            CGFloat x = c *(width + padding) + (SCREEN_WIDTH - fullWidth) /2;
            CGFloat y = r *(height + padding) + (SCREEN_HEIGHT - fullHeight) /2;
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
            
            button.backgroundColor = playerColors[0];
            
//            [button setTitle:[NSString stringWithFormat:@"%d",buttonCount] forState:UIControlStateNormal];
            
            button.tag = buttonCount;
            
            [button addTarget:self action:@selector(squareTapped:) forControlEvents:UIControlEventTouchUpInside];
//            [button addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
            
            button.layer.cornerRadius = height / 2;
            button.alpha = 0.6;
            
            
            [self.view addSubview:button];
            
            
            [buttons addObject:button];
            
            buttonCount++;
        }
    }
    
    //NSLog(@"subviews %@",self.view.subviews);
    
}
             
- (void)squareTapped: (UIButton *)button {
    
    if ([squares[button.tag] intValue] != 0) {
        return;
    }
        

    
    squares[button.tag] = @(playerTurn);
    
    //[button setTitle:[NSString stringWithFormat:@"%d",playerTurn ] forState:UIControlStateNormal];
    
    button.backgroundColor = playerColors[playerTurn];
    
    playerTurn = (playerTurn ==2) ? 1 : 2;
    
    
//    if (playerTurn ==1)  {
//        button.backgroundColor = [UIColor greenColor];
//        
//    }else{
//             button.backgroundColor = [UIColor redColor];
//        }
    
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
        
//        switch (player) {
//            case 1:
//                self.player1Score++;
//                break;
//                
//            case 2:
//                self.player2Score++;
//                break;
//        }
        
        if (player == 1) {
            self.player1Score ++;
  //          score1Label.text = [NSString stringWithFormat:@"Player 1:%d", self.player1Score];

        }
        
         if (player == 2) {
            self.player2Score++;
  //           score2Label.text = [NSString stringWithFormat:@"Player 2:%d", self.player2Score];
        }
        

        
        NSString *message = [NSString stringWithFormat:@"Player %d Won", player];
        
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Winner" message:message delegate:self cancelButtonTitle:@"Play Again Now!" otherButtonTitles:nil];
        
        [alertView show];
        
    }
    
}

- (void)reset {
    
   
    for (UIButton *button in buttons) {
        
        button.backgroundColor = playerColors [0];
 //       button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"" forState:UIControlStateNormal];
    }
    
  //         NSLog(@"Play Again");
    
    score1Label.text = [NSString stringWithFormat:@"Player 1:0"];
    score2Label.text = [NSString stringWithFormat:@"Player 1:0"];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // square titles
    for (UIButton *button in buttons) {
        
        
//        button.backgroundColor = [UIColor blueColor];
         button.backgroundColor = playerColors [0];
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
