//
//  TextField.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/12/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCTextField.h"

@implementation LCTextField

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
    UIToolbar * numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithKeyboard)],
                           nil];
    [numberToolbar sizeToFit];
    self.inputAccessoryView = numberToolbar;
  
    CGRect frame = self.frame;
    frame.size.height += 10;
    self.frame = frame;

    NSString* textFieldImageName = @"lctextfield";
    if (![self isOnBundle])
    {
        textFieldImageName = @"LasagnaCookiesBundle.bundle/lctextfield";
    }
    
    UIImage *buttonImage = [[UIImage imageNamed:textFieldImageName] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    [self setBackground:buttonImage];
    [self setBorderStyle:UITextBorderStyleNone];
    self.textColor = [UIColor colorWithRed:245/255.f green:122/255.f blue:89/255.f alpha:1];
    self.font = [UIFont boldSystemFontOfSize:14];
    [[self valueForKey:@"textInputTraits"] setValue:[UIColor colorWithRed:245/255.f green:122/255.f blue:89/255.f alpha:1]forKey:@"insertionPointColor"];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10, 0);
}

- (void)doneWithKeyboard
{
    [self resignFirstResponder];
}

- (BOOL)isOnBundle
{
    if ([UIImage imageNamed:@"lcbutton"])
        return NO;
    return YES;
}

@end
