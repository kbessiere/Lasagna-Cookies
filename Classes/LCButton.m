//
//  Button.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/11/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCButton.h"

@implementation LCButton

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
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    NSString* buttonImageText = @"LasagnaCookiesBundle.bundle/button";
    NSString* buttonImageHighlightText = @"LasagnaCookiesBundle.bundle/button-highlighted";
    UIImage *buttonImage = [[UIImage imageNamed:buttonImageText] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 5, 15, 5)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:buttonImageHighlightText] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 5, 15, 5)];
    [self setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    [self setBackgroundImage:buttonImageHighlight forState:UIControlStateDisabled];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [self setTitleShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.36] forState:UIControlStateNormal];
    [self setTitleShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.36] forState:UIControlStateHighlighted];
    self.titleLabel.shadowOffset = CGSizeMake(0, -1);
}

@end
