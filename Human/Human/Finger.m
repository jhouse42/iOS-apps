//
//  Finger.m
//  Human
//
//  Created by Jeanie House on 1/6/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "Finger.h"

@implementation Finger

@synthesize fingerPrint = _fingerPrint;

// NSString *fingerPrint = finger.fingerPrint;
- (NSString *)fingerPrint {
    
    return _fingerPrint;
}

// finger.fingerPrint = @"fingerPrint";
- (void)setFingerPrint:(NSString *)fingerPrint {
    
    _fingerPrint = fingerPrint;
}

@end
