//
//  Rectangle.m
//  Shapes
//
//  Created by Jeanie House on 1/13/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "Rectangle.h"

IB_DESIGNABLE

@implementation Rectangle


//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextFillRect(context, rect);
    [self.fillColor set];
    
    CGContextMoveToPoint(context, 0, 0);
    
    CGContextAddLineToPoint(context,rect.size.width, 0);
    CGContextAddLineToPoint(context,rect.size.width,rect.size.height);
    CGContextAddLineToPoint(context, 0,rect.size.height);
    CGContextAddLineToPoint(context,0, 0);
    
    CGContextFillPath(context);
    
}

//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //Call function to draw rectangle
//    [self drawRectangleAtTopOfScreen:context];
//    
//    //call function to draw circle
//    [self drawEllipse:context];
//    
//}
//
//-(void)drawRectangleAtTopOfScreen:(CGContextRef)context
//{
//    
//    CGContextSaveGState(context);
//    //Set color of current context
//    [[UIColor yellowColor] set];
//    
//    //Draw rectangle
//    CGRect drawingRect = CGRectMake(25, 80, 320, 60);
//    CGContextFillRect(context, drawingRect);
//    CGContextRestoreGState(context);
//    
//    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(82, 63, 124, 33)];
//    [UIColor.grayColor setFill];
//    [rectanglePath fill];
//}
//
//-(void)drawEllipse:(CGContextRef)context
//{
//    
//    CGContextSaveGState(context);
//    
//    //Set color of current context
//    [[UIColor blueColor] set];
//    
//    //Draw ellipse 
//    CGRect ellipseRect = CGRectMake(60.0f, 150.0f, 200.0f, 200.0f);
//    CGContextFillEllipseInRect(context, ellipseRect);
//    CGContextRestoreGState(context);
//    
//}

@end
