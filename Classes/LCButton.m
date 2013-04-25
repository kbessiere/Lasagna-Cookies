//
//  Button.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/11/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "LCButton.h"
#import "LCManager.h"
#import "UIColor+hex.h"

@interface LCButton()

@property (nonatomic, strong) UIColor * gradientEnd;
@property (nonatomic, strong) UIColor * stroke;
@property (nonatomic, strong) UIColor * highlightedColor;

@end

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

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"highlighted"];
}

- (void)setup
{
    [self initColors];
    [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [self setTitleShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.36] forState:UIControlStateNormal];
    [self setTitleShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.36] forState:UIControlStateHighlighted];
    self.titleLabel.shadowOffset = CGSizeMake(0, -1);
    self.layer.cornerRadius = 3;
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
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (self.state != UIControlStateHighlighted)
        [self drawLinearGradient:context inRect:rect withStartColor:self.mainColor.CGColor withEndColor:self.gradientEnd.CGColor];
    else
        [self drawLinearGradient:context inRect:rect withStartColor:self.highlightedColor.CGColor withEndColor:self.gradientEnd.CGColor];    
    CGContextFillPath(context);
}

- (void)drawLinearGradient:(CGContextRef)context inRect:(CGRect)rect withStartColor:(CGColorRef)startColor
              withEndColor:(CGColorRef) endColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray * colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    if (self.layer.cornerRadius == 0)
    {
        CGContextAddRect(context, rect);
        CGContextSetStrokeColorWithColor(context, self.stroke.CGColor);
        CGContextSetLineWidth(context, 1.5);
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
        CGContextStrokeRect(context, rect);
    }
    else
    {
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.layer.cornerRadius];
        CGContextSetStrokeColorWithColor(context, self.stroke.CGColor);
        CGContextSaveGState(context);
        [path setLineWidth:1.5];
        [path fill];
        [path addClip];
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
        [path stroke];
    }
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([@"highlighted" isEqualToString:keyPath])
    {
        [self setNeedsDisplay];
    }
}


@end
