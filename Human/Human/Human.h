//
//  Human.h
//  Human
//
//  Created by Jeanie House on 1/6/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Body;
// create a Body Class and add it as a property to Human

// create Leg, Head Classes and add them and Arm as properties on the Body

// Add 10 additional Clases for other parts- toes-(bendUp,bendDown), eyes-(color,blink property), ears-(big,small), nose- (blow,sniff), hair (grow,color-property)
// back(bend,twist), neck-(bend,twist), foot-(twist,turn), toenail-(grow,break), knee-(bend,break)

// create 2 methods on each class (EX: Mouth will have - (void)chewFood:(id)food;)

// add 2 properties per class that define the part (not including properties like finger)

// No getters and setters

@interface Human : NSObject


@property  (nonatomic) Body *body;



@end
