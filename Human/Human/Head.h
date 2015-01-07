//
//  Head.h
//  Human
//
//  Created by Jeanie House on 1/6/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Head : NSObject


@property (nonatomic) NSString *big;
@property (nonatomic) NSString *flat;

-(void)tiltLeft;
-(void)turnRight;

@end
