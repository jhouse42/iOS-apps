//
//  Robot.h
//  Speaking
//
//  Created by Jeanie House on 1/13/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RobotDelegate;


@interface Robot : NSObject

- (void)cleanHouse;
- (void)dance;

@property (nonatomic,assign) id <RobotDelegate> delegate;


@end

@protocol RobotDelegate <NSObject>


- (int)howManyRoomsDoIHaveToClean;

- (NSString *)whatTypeOfDance;

@optional

- (int)howMuchPowerCanIHave;

@end