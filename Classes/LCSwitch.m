//
//  LCSwitch.m
//  LasagnaCookies
//
//  Created by Kevin Bessiere on 4/19/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCSwitch.h"
#import "LCSwitchLayer.h"

@implementation LCSwitch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
		[self setup];
	}
    
	return self;
}

- (void)setup
{
    LCSwitchLayer * layer = [[LCSwitchLayer alloc] init];
    [self.layer addSublayer:layer];
    [layer setNeedsDisplay];
}

@end
