//
//  LCViewController.h
//  LasagnaCookies
//
//  Created by Kevin Bessiere on 4/17/13.
//  Copyright (c) 2013 Kevin Bessiere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCButton.h"
#import "LCCheckbox.h"
#import "LCRadio.h"

@interface LCViewController : UIViewController
{
    IBOutlet LCButton * button;
    IBOutlet LCRadio * checkbox1;
    IBOutlet LCRadio * checkbox2;
    IBOutlet LCRadio * checkbox3;
    IBOutlet LCRadio * checkbox4;
}



@end
