//
//  Radio.m
//  UiThemeiOS
//
//  Created by Kevin Bessiere on 4/12/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCRadio.h"

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
//    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, 24, 24)];
//
//    NSString* selectedImageName = @"lcradio-selected";
//    NSString* unselectedImageName = @"lcradio-unselected";
//    if (![self isOnProjectResources])
//    {
//        selectedImageName = @"LasagnaCookiesBundle.bundle/lcradio-selected";
//        unselectedImageName = @"LasagnaCookiesBundle.bundle/lcradio-unselected";
//    }
//
//    UIImage * selectedImage = [UIImage imageNamed:selectedImageName];
//    UIImage * unselectedImage = [UIImage imageNamed:unselectedImageName];
//    
//    [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
//    [self setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
//    [self setBackgroundImage:unselectedImage forState:UIControlStateNormal];
//    [self addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchDown];
//    self.titleLabel.text = @"";
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
    CGContextAddEllipseInRect(context, rect);
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, self.unckeckedColor.CGColor);
    CGContextStrokePath(context);
}




@end
