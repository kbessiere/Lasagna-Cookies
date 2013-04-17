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
    
    NSString * selectedText = @"LasagnaCookiesBundle.bundle/radio-selected";
    NSString * unselectedText = @"LasagnaCookiesBundle.bundle/radio-unselected";
    
    UIImage * selectedImage = [UIImage imageNamed:selectedText];
    UIImage * unselectedImage = [UIImage imageNamed:unselectedText];
    
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

@end
