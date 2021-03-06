//
//  Ellipse.m
//  Shapes
//
//  Created by Jeanie House on 1/13/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "Ellipse.h"

IB_DESIGNABLE

@implementation Ellipse


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
        // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.fillColor set];
    
//    CGContextFillEllipseInRect(context, rect);
    
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    CGFloat xCP = w /4;
    CGFloat yCP = h /4;
    CGContextMoveToPoint(context, w / 2, 0);
    
    CGContextAddCurveToPoint(context, w - xCP, 0, w, yCP, w, h /2);
    
    
    CGContextAddCurveToPoint(context, w, h - yCP, w - xCP, h, w / 2, h);
    
    CGContextAddCurveToPoint(context, xCP, h, 0, h - yCP, 0, h / 2);
    
    CGContextAddCurveToPoint(context, 0, yCP, xCP, 0, w / 2, 0);
    CGContextFillPath(context);
    
}


//    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(103, 37, 50, 50)];
//    [UIColor.grayColor setFill];
//    [ovalPath fill];
//    
//        
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        
//        CGContextSetLineWidth(context, 2.0);
//        
//        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//        
//        CGRect rectangle = CGRectMake(ellipse.origin.x, ellipse.origin.y, ellipse.size.width, ellipse.size.height);
//        
//        CGContextAddEllipseInRect(context, rectangle);
//        
//        CGContextStrokePath(context);
//    
    
    
    






@end
