//
//  Checkbox.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/12/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCCheckbox.h"

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
    self.unckeckedColor = [UIColor colorWithRed:211/255.f green:211/255.f blue:211/255.f alpha:1];
}

- (void)setup
{
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
    {
        CGContextSetFillColorWithColor(context, self.mainColor.CGColor);
        CGContextSetAlpha(context, 1);
        CGContextFillRect(context, rect);

        CGContextSetLineWidth(context, 3);
        CGContextSetStrokeColorWithColor(context, self.stroke.CGColor);
        CGContextStrokeRect(context, rect);
        [self drawValidateSymbole:context inRect:rect];
    }
    else if (self.highlighted)
    {
        CGContextSetFillColorWithColor(context, self.highlightedColor.CGColor);
        CGContextSetAlpha(context, 1);
        CGContextFillRect(context, rect);
        
        CGContextSetLineWidth(context, 3);
        CGContextSetStrokeColorWithColor(context, self.stroke.CGColor);
        CGContextStrokeRect(context, rect);
    }
    else
    {
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextSetAlpha(context, 1);
        CGContextFillRect(context, rect);

        CGContextSetLineWidth(context, 3);
        CGContextSetStrokeColorWithColor(context, self.unckeckedColor.CGColor);
        CGContextStrokeRect(context, rect);
    }
    CGContextFillPath(context);
}

- (void)drawValidateSymbole:(CGContextRef)context inRect:(CGRect)rect
{
    CGContextSetLineWidth(context, (int)(CGRectGetWidth(rect) / 10));
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);

    CGContextMoveToPoint(context, CGRectGetWidth(rect) * 0.40f, CGRectGetHeight(rect) * 0.71f);
    CGContextAddLineToPoint(context, CGRectGetWidth(rect) * 0.79f, CGRectGetHeight(rect) * 0.28f);

    CGContextMoveToPoint(context, CGRectGetWidth(rect) * 0.44f, CGRectGetHeight(rect) * 0.74f);
    CGContextAddLineToPoint(context, CGRectGetWidth(rect) * 0.20f, CGRectGetHeight(rect) * 0.56f);
    
    CGContextStrokePath(context);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}


@end
