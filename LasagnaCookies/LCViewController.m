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
    checkbox.mainColor = [UIColor colorWithHexa:0x97CCEE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
