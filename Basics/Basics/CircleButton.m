//
//  CircleButton.m
//  Basics
//
//  Created by Jeanie House on 1/5/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "CircleButton.h"

@implementation CircleButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.layer.cornerRadius = self.frame.size.height /2;
    self.layer.masksToBounds = YES;
}


@end
