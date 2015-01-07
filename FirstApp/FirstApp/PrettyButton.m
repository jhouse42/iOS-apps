//
//  PrettyButton.m
//  FirstApp
//
//  Created by Jeanie House on 1/5/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "PrettyButton.h"



@implementation PrettyButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.layer.cornerRadius = 60;
    self.layer.masksToBounds = YES;
}


@end
