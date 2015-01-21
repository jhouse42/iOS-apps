//
//  ScribbleView.m
//  Scribble Touch
//
//  Created by Jeanie House on 1/14/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "ScribbleView.h"

@implementation ScribbleView

//        @[
//
//         @[
//            @"type":@"path",
//            @"fillColor":[UIColor greenColor],
//            @"strokeColor":[UIColor blackColor],
//            @"strokeWidth":@2;
//            @"points":@[CGpoint,CGpoint,CGpoint]
//        },
//
//          @[
//            @"type":@"circle",
//            @"fillColor":[UIColor greenColor],
//            @"strokeColor":[UIColor blackColor],
//            @"strokeWidth":@2;
//            @"frame":CGrect
//        }
//        ];


- (NSMutableArray *) scribbles {
    
    if (_scribbles == nil) { _scribbles = [@[] mutableCopy];}
    return _scribbles;
    }


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    
    
    for (NSDictionary *scribble in self.scribbles) {
        
        CGContextSetLineWidth(context, [scribble[@"strokeWidth"]floatValue]);
        
  //       CGContextSetBlendMode(context, kCGBlendModeScreen);
        
         CGContextSetAlpha(context, 0.6);
 //        CGContextSetBlendMode(context, kCGBlendModeMultiply);
        
        UIColor *strokeColor = scribble[@"strokeColor"];
        [strokeColor set];
        
        
        CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
        
        for (NSValue *pointValue in scribble[@"points"]) {
            
            CGPoint point = [pointValue CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
     //       CGContextSetBlendMode(context, kCGBlendModeScreen);
            
            
            
        }
        
        CGContextStrokePath(context);
        
        CGContextSetAlpha(context, 0.6);
        
 //       CGContextSetBlendMode(context, kCGBlendModeMultiply);
        
        UIColor *fillColor = scribble[@"fillColor"];
        [fillColor set];
        
        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
        
        for (NSValue *pointValue in scribble[@"points"]) {
            CGPoint point = [pointValue CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
            
        }
        
        CGContextFillPath(context);
        
        
        
        
    }
    
   
        
}


@end
