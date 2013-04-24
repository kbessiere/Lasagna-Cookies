//
//  LCViewController.m
//  LasagnaCookies
//
//  Created by Kevin Bessiere on 4/17/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCViewController.h"
#import "UIColor+hex.h"
#import "LCManager.h"

#import <QuartzCore/QuartzCore.h>

@interface LCViewController ()

@end

@implementation LCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    textfield.layer.cornerRadius = 0;
    
    // Set a different color for the button
	button1.mainColor = [UIColor colorWithHexa:0x3CB5B5];
    // Set a different corner radius
    button1.layer.cornerRadius = 0;

    button2.mainColor = [UIColor colorWithHexa:0x00A1CB];
    button2.layer.cornerRadius = 5;

    button3.mainColor = [UIColor colorWithHexa:0xCE5973];
    button3.layer.cornerRadius = 7;
    
    checkbox1.mainColor = [UIColor colorWithHexa:0x97CCEE];
    checkbox1.layer.cornerRadius = 0;
    
    checkbox2.mainColor = [UIColor colorWithHexa:0x98C73D];
    
    
    radio1.mainColor = [UIColor colorWithHexa:0xFFD843];
    radio2.mainColor = [UIColor colorWithHexa:0xCDE8D5];
    radio3.mainColor = [UIColor colorWithHexa:0xFCA44B];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
