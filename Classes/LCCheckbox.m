//
//  Checkbox.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/12/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCCheckbox.h"
#import "LCManager.h"
#import "UIColor+hex.h"

#import <QuartzCore/QuartzCore.h>

@interface LCCheckbox()

@property (nonatomic, strong) UIColor * gradientEnd;
@property (nonatomic, strong) UIColor * stroke;
@property (nonatomic, strong) UIColor * highlightedColor;
@property (nonatomic, strong) UIColor * unckeckedColor;

@end

@implementation LCCheckbox

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

- (void)setMainColor:(UIColor *)mainColor
{
    _mainColor = mainColor;
    [self initColors];
}

- (void)initColors
{
    if (self.mainColor == nil)
        self.mainColor = [UIColor colorWithHexa:[LCManager LCThemeColor]];
    const CGFloat * components = CGColorGetComponents(self.mainColor.CGColor);
    self.gradientEnd = [UIColor colorWithRed:(((components[0] * 255) - 10) / 255)
                                       green:(((components[1] * 255) - 20) / 255)
                                        blue:(((components[2] * 255) - 20) / 255)
                                       alpha:1];
    
    self.stroke = [UIColor colorWithRed:(((components[0] * 255) - 60) / 255)
                                  green:(((components[1] * 255) - 50) / 255)
                                   blue:(((components[2] * 255) - 45) / 255)
                                  alpha:1];
    
    self.highlightedColor = [UIColor colorWithRed:(((components[0] * 255) - 30) / 255)
                                            green:(((components[1] * 255) - 50) / 255)
                                             blue:(((components[2] * 255) - 30) / 255)
                                            alpha:1];
    self.unckeckedColor = [UIColor colorWithRed:211/255.f green:211/255.f blue:211/255.f alpha:1];
}

- (void)setup
{
    self.layer.cornerRadius = 4;
    [self initColors];
    [self addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchDown];
    [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)select:(id)sender
{
    self.selected = !self.selected;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (self.isSelected)
        [self drawCheckBox:context inRect:rect withColor:self.mainColor.CGColor andStrokeColor:self.stroke.CGColor];
    else if (self.highlighted)
        [self drawCheckBox:context inRect:rect withColor:self.highlightedColor.CGColor andStrokeColor:self.stroke.CGColor];
    else
        [self drawCheckBox:context inRect:rect withColor:[UIColor whiteColor].CGColor andStrokeColor:self.unckeckedColor.CGColor];
}

- (void)drawValidateSymbole:(CGContextRef)context inRect:(CGRect)rect
{
    CGContextSetLineWidth(context, CGRectGetWidth(rect) / 10);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);

    CGContextMoveToPoint(context, CGRectGetWidth(rect) * 0.40f, CGRectGetHeight(rect) * 0.71f);
    CGContextAddLineToPoint(context, CGRectGetWidth(rect) * 0.79f, CGRectGetHeight(rect) * 0.28f);

    CGContextMoveToPoint(context, CGRectGetWidth(rect) * 0.44f, CGRectGetHeight(rect) * 0.74f);
    CGContextAddLineToPoint(context, CGRectGetWidth(rect) * 0.20f, CGRectGetHeight(rect) * 0.56f);
    
    CGContextStrokePath(context);
}

- (void)drawCheckBox:(CGContextRef)context inRect:(CGRect)rect withColor:(CGColorRef)color andStrokeColor:(CGColorRef)strokeColor
{
    if (self.layer.cornerRadius == 0)
    {
        CGContextSetFillColorWithColor(context, color);
        CGContextSetAlpha(context, 1);
        CGContextFillRect(context, rect);
        
        CGContextSetLineWidth(context, CGRectGetWidth(rect) / 10);
        CGContextSetStrokeColorWithColor(context, strokeColor);
        CGContextStrokeRect(context, rect);
        if (self.selected || self.highlighted)
            [self drawValidateSymbole:context inRect:rect];
        
        CGContextFillPath(context);
    }
    else
    {
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.layer.cornerRadius];
        CGContextSetStrokeColorWithColor(context, strokeColor);
        CGContextSetFillColorWithColor(context, color);
        CGContextSaveGState(context);
        [path setLineWidth:CGRectGetWidth(rect) / 10];
        [path fill];
        [path addClip];
        [path stroke];
        if (self.selected || self.highlighted)
            [self drawValidateSymbole:context inRect:rect];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}


@end
