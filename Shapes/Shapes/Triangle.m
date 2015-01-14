//
//  Triangle.m
//  Shapes
//
//  Created by Jeanie House on 1/13/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "Triangle.h"

IB_DESIGNABLE

@implementation Triangle


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.fillColor set];
    
    CGContextMoveToPoint(context, rect.size.width /2, 0);
    
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    
    CGContextAddLineToPoint(context, 0, rect.size.width);
    
    CGContextAddLineToPoint(context, rect.size.width / 2, 0);
    CGContextFillPath(context);
    
}
//
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    CGContextBeginPath(ctx);
//    CGContextMoveToPoint   (ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));  // top left
//    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMidY(rect));  // mid right
//    CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));  // bottom left
//    CGContextClosePath(ctx);
//    
//    CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
//    CGContextFillPath(ctx);
//    
//    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
//    [bezierPath moveToPoint: CGPointMake(112.5, 81.5)];
//    [bezierPath addCurveToPoint: CGPointMake(158.5, 81.5) controlPoint1: CGPointMake(157.5, 79.5) controlPoint2: CGPointMake(158.5, 81.5)];
//    [bezierPath addLineToPoint: CGPointMake(134.5, 28.5)];
//    [bezierPath addLineToPoint: CGPointMake(112.5, 81.5)];
//    [bezierPath addLineToPoint: CGPointMake(112.5, 81.5)];
//    [UIColor.blackColor setStroke];
//    bezierPath.lineWidth = 1;
//    [bezierPath stroke];


@end
