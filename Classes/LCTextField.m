//
//  TextField.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/12/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCTextField.h"
#import "UIColor+hex.h"
#import "LCManager.h"

#import <QuartzCore/QuartzCore.h>

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
    self.layer.cornerRadius = 3;
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
        self.mainColor = [UIColor colorWithHexa:[LCManager LCThemeColor]];
    //self.textColor = self.mainColor;
    self.font = [UIFont boldSystemFontOfSize:14];
    self.unckeckedColor = [UIColor colorWithHexa:0xA8A8A8];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
   
    if (self.layer.cornerRadius == 0)
    {
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextSetAlpha(context, 1);
        CGContextSetShadow(context, CGSizeMake(0, 0), 2);
        CGContextFillRect(context, rect);
        
        CGContextSetLineWidth(context, 1.5);
        CGContextSetStrokeColorWithColor(context, self.unckeckedColor.CGColor);
        CGContextStrokeRect(context, rect);
        CGContextFillPath(context);
    }
    else
    {
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.layer.cornerRadius];
        CGContextSetStrokeColorWithColor(context, self.unckeckedColor.CGColor);
        CGContextSetShadow(context, CGSizeMake(0, 0), 2);
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextSaveGState(context);
        [path setLineWidth:1.5];
        [path fill];
        [path addClip];
        [path stroke];
    }
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
