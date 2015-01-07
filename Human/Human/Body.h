//
//  Body.h
//  Human
//
//  Created by Jeanie House on 1/6/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Arm;
@class Leg;
@class Head;


@interface Body : NSObject



@property  (nonatomic) Arm *arm;
@property  (nonatomic) Leg *leg;
@property  (nonatomic) Head *head;

@end
