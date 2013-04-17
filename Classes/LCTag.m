//
//  Tag.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/11/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCTag.h"

@implementation LCTag

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
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 27)];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    NSString* buttonImageText = @"LasagnaCookiesBundle.bundle/tag";
    UIImage *buttonImage = [[UIImage imageNamed:buttonImageText] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 18)];
    [self setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self setBackgroundImage:buttonImage forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor colorWithRed:154/255.f green:154/255.f blue:154/255.f alpha:1] forState:UIControlStateNormal];
     [self setTitleColor:[UIColor colorWithRed:154/255.f green:154/255.f blue:154/255.f alpha:1] forState:UIControlStateHighlighted];
}


@end
