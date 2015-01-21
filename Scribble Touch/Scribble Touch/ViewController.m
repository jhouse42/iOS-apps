//
//  ViewController.m
//  Scribble Touch
//
//  Created by Jeanie House on 1/14/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "ViewController.h"
#import "ScribbleView.h"


@interface ViewController ()





@end

@implementation ViewController

{
    NSMutableDictionary *currentScribble;
    UIColor *selectedColor;
    int selectedStrokeWidth;
    UIColor * selectedFillColor;
    int changeAlpha;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    selectedColor = [UIColor blackColor];
    selectedStrokeWidth = 1;
    selectedFillColor = [UIColor clearColor];
    changeAlpha = 1;
}


- (IBAction)changeColor:(UIButton *)sender {
    
    selectedColor = sender.backgroundColor;
    
}

- (IBAction)changeStrokeWidth:(UISlider *)sender {
    
    selectedStrokeWidth = sender.value;
}


- (IBAction)selectedFillColor:(UIButton *)sender {
    selectedFillColor = sender.backgroundColor;
    
}


- (IBAction)changeAlpha:(UISlider *)sender {
    
    changeAlpha = sender.value;
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
  
    
    currentScribble = [@{
                         
                         @"type":@"path",
                         @"fillColor":selectedFillColor,
                         @"strokeColor":selectedColor,
                         @"strokeWidth":@(selectedStrokeWidth),
                         @"points":[@[[NSValue valueWithCGPoint:location]] mutableCopy],
                         @"alpha":@(changeAlpha)
                         
                         } mutableCopy];
    
    ScribbleView *sView = (ScribbleView *)self.view;
    [sView.scribbles addObject:currentScribble];
    
    
    
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    [currentScribble[@"points"] addObject:[NSValue valueWithCGPoint:location]];
    
    [self.view setNeedsDisplay];
}




@end
