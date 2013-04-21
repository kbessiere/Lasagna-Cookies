//
//  Radio.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/12/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCRadio.h"
#import "UIColor+hex.h"

@interface LCRadio()

@property (nonatomic, strong) UIColor * gradientEnd;
@property (nonatomic, strong) UIColor * stroke;
@property (nonatomic, strong) UIColor * highlightedColor;

@property (nonatomic, strong) UIColor * unckeckedColor;

@end

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
    [self initColors];
    [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];
    [self addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchDown];
}

- (void)select:(id)sender
{
    self.selected = !self.selected;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawCircle:context inRect:rect];
    CGContextFillPath(context);
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


- (void)drawCircle:(CGContextRef)context inRect:(CGRect)rect
{
    CGRect newRect = CGRectMake(rect.origin.x + 1, rect.origin.y + 1, rect.size.width - 2, rect.size.height - 2);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetAlpha(context, 1);
    CGContextFillEllipseInRect(context, rect);

    
    CGContextSetLineWidth(context, CGRectGetWidth(newRect) / 20);
    CGContextSetStrokeColorWithColor(context, self.unckeckedColor.CGColor);
    CGContextStrokeEllipseInRect(context, newRect);
    
    float margin =  CGRectGetWidth(newRect) / 5.5f;
    
    if (self.isSelected)
    {
        CGRect centerCircle = CGRectMake(rect.origin.x + margin, rect.origin.y + margin, rect.size.width - (margin * 2), rect.size.height - margin * 2);
        CGContextSetFillColorWithColor(context, self.mainColor.CGColor);
        CGContextSetAlpha(context, 1);
        CGContextFillEllipseInRect(context, centerCircle);
        
        CGContextSetLineWidth(context, CGRectGetWidth(newRect) / 20);
        CGContextSetStrokeColorWithColor(context, self.stroke.CGColor);
        CGContextStrokeEllipseInRect(context, centerCircle);
    }
    if (self.highlighted)
    {
        CGRect centerCircle = CGRectMake(rect.origin.x + margin, rect.origin.y + margin, rect.size.width - (margin * 2), rect.size.height - margin * 2);
        CGContextSetFillColorWithColor(context, self.highlightedColor.CGColor);
        CGContextSetAlpha(context, 1);
        CGContextFillEllipseInRect(context, centerCircle);
        
        CGContextSetLineWidth(context, 1.5);
        CGContextSetStrokeColorWithColor(context, self.stroke.CGColor);
        CGContextStrokeEllipseInRect(context, centerCircle);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}


@end
