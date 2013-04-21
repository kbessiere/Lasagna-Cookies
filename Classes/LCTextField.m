//
//  TextField.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/12/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCTextField.h"

@interface LCTextField()

@property (nonatomic, strong) UIColor * unckeckedColor;

@end

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
    [self initColors];
    UIToolbar * numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithKeyboard)],
                           nil];
    [numberToolbar sizeToFit];
    self.inputAccessoryView = numberToolbar;
}

- (void)initColors
{
    if (self.mainColor == nil)
        self.mainColor = [UIColor colorWithRed:245/255.f green:122/255.f blue:89/255.f alpha:1];
    self.textColor = self.mainColor;
    self.font = [UIFont boldSystemFontOfSize:14];
    self.unckeckedColor = [UIColor colorWithRed:211/255.f green:211/255.f blue:211/255.f alpha:1];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
   
    CGContextAddRect(context, rect);
    CGContextSetShadow(context, CGSizeMake(0, 0), 2);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
    
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, self.unckeckedColor.CGColor);
    CGContextStrokeRect(context, rect);
    CGContextFillPath(context);
}

- (void)doneWithKeyboard
{
    [self resignFirstResponder];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10, 0);
}


@end
