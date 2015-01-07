//
//  Arm.h
//  Human
//
//  Created by Jeanie House on 1/6/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Hand;

@interface Arm : NSObject

@property (nonatomic) Hand *hand;

-(void)raiseUp;
-(void)pushOut;

@end
