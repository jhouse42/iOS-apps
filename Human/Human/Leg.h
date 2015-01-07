//
//  Leg.h
//  Human
//
//  Created by Jeanie House on 1/6/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Leg : NSObject

@property (nonatomic) NSString *smooth;
@property (nonatomic) NSString *wide;

-(void)liftUp;
-(void)pushDown;

@end
