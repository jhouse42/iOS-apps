//
//  Foot.h
//  Human
//
//  Created by Jeanie House on 1/6/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foot : NSObject

@property (nonatomic) NSString *wide;
@property (nonatomic) NSString *arched;

-(void)bendUp:(int *)angle;
-(void)twistLeft;

@end
