//
//  Button.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/11/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "LCButton.h"

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

- (void)setup
{
    [self initColors];
    [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [self setTitleShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.36] forState:UIControlStateNormal];
    [self setTitleShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.36] forState:UIControlStateHighlighted];
    self.titleLabel.shadowOffset = CGSizeMake(0, -1);
}

- (void)setMainColor:(UIColor *)mainColor
{
    _mainColor = mainColor;
    [self initColors];
}

- (void)initColors
{
    if (self.mainColor == nil)
        self.mainColor = [UIColor colorWithRed:245/255.f green:122/255.f blue:89/255.f alpha:1];
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
        drawLinearGradient(context, rect, self.mainColor.CGColor, self.gradientEnd.CGColor);
    else
        drawLinearGradient(context, rect, self.highlightedColor.CGColor, self.gradientEnd.CGColor);
 
    
    CGRect strokeRect = CGRectInset(rect, 0, 0);
    CGContextSetStrokeColorWithColor(context, self.stroke.CGColor);
    CGContextSetLineWidth(context, 2.0);
    CGContextStrokeRect(context, strokeRect);
    
    CGContextFillPath(context);
}

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextAddRect(context, rect);
    CGContextSaveGState(context);
    
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
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
