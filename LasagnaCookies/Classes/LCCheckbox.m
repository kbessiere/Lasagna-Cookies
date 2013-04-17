//
//  Checkbox.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/12/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCCheckbox.h"

@implementation LCCheckbox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

    NSString * selectedText = @"LasagnaCookiesBundle.bundle/checkbox-selected";
    NSString * unselectedText = @"LasagnaCookiesBundle.bundle/checkbox-unselected";
    
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
