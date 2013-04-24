//
//  LCManager.m
//  LasagnaCookies
//
//  Created by Kevin Bessiere on 4/24/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCManager.h"

static int LC_THEME_COLOR = 0xF57A59;

@implementation LCManager

+ (int)LCThemeColor
{
    return LC_THEME_COLOR;
}

+ (void)setLCThemeColor:(int)aHexaColor
{
    LC_THEME_COLOR = aHexaColor;
}

@end
