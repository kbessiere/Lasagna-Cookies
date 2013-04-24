//
//  UIColor+hex.m
//  LasagnaCookies
//
//  Created by Kevin Bessiere on 4/19/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "UIColor+hex.h"

@implementation UIColor (hex)

+ (UIColor *) colorWithHexa:(int)colorHexa
{
    float red = ((colorHexa & 0xFF0000) >> 16) /255.0f;
    float green = ((colorHexa & 0xFF00) >> 8)/255.0f;
    float blue = (colorHexa & 0xFF)/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

@end
