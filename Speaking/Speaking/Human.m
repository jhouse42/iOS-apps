//
//  Human.m
//  Speaking
//
//  Created by Jeanie House on 1/13/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "Human.h"
#import "Robot.h"


@interface Human () <RobotDelegate>

@end

@implementation Human

- (void)makeRobot {
    
    Robot *oldRustyRobot = [[Robot alloc] init];
    
    oldRustyRobot.delegate = self;
  
    [oldRustyRobot cleanHouse];
    
    [oldRustyRobot dance];
    
}

- (NSString *)whatTypeOfDance {
    
    return @"The Robot";
}


- (int)howManyRoomsDoIHaveToClean {
    return 1000000;
    
}

@end
