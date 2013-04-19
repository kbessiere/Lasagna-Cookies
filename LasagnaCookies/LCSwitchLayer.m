//
//  LCSwitchLayer.m
//  LasagnaCookies
//
//  Created by Kevin Bessiere on 4/19/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCSwitchLayer.h"

@implementation LCSwitchLayer

- (void)drawInContext:(CGContextRef)context
{
    NSLog(@"x = %f y = %f width = %f height = %f", self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    CGContextDrawImage(context, self.frame, [UIImage imageNamed:@"lcswitch-on"].CGImage);
}

@end
