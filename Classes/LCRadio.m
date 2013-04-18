//
//  Radio.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/12/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCRadio.h"

@implementation LCRadio

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
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, 24, 24)];

    NSString* selectedImageName = @"lcradio-selected";
    NSString* unselectedImageName = @"lcradio-unselected";
    if (![self isOnBundle])
    {
        selectedImageName = @"LasagnaCookiesBundle.bundle/lcradio-selected";
        unselectedImageName = @"LasagnaCookiesBundle.bundle/lcradio-unselected";
    }

    UIImage * selectedImage = [UIImage imageNamed:selectedImageName];
    UIImage * unselectedImage = [UIImage imageNamed:unselectedImageName];
    
    [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
    [self setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
    [self setBackgroundImage:unselectedImage forState:UIControlStateNormal];
    [self addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchDown];
    self.titleLabel.text = @"";
}

- (void)select:(id)sender
{
    self.selected = !self.selected;
}

- (BOOL)isOnBundle
{
    if ([UIImage imageNamed:@"lcbutton"])
        return NO;
    return YES;
}

@end
