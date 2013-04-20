//
//  LCViewController.m
//  LasagnaCookies
//
//  Created by Kevin Bessiere on 4/17/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import "LCViewController.h"
#import "UIColor+hex.h"

@interface LCViewController ()

@end

@implementation LCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	button.mainColor = [UIColor colorWithHexa:0xAE1215];

    radio1.mainColor = [UIColor colorWithHexa:0x97CCEE];
    radio2.mainColor = [UIColor colorWithHexa:0xD31996];
    radio3.mainColor = [UIColor colorWithHexa:0x708D91];
    radio4.mainColor = [UIColor colorWithHexa:0x19DD89];
    
    checkbox1.mainColor = [UIColor colorWithHexa:0x97CCEE];
    checkbox2.mainColor = [UIColor colorWithHexa:0xD31996];
    checkbox3.mainColor = [UIColor colorWithHexa:0x708D91];
    checkbox4.mainColor = [UIColor colorWithHexa:0x19DD89];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
