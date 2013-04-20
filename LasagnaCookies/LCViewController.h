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
 
    IBOutlet LCRadio * radio1;
    IBOutlet LCRadio * radio2;
    IBOutlet LCRadio * radio3;
    IBOutlet LCRadio * radio4;
    
    IBOutlet LCCheckbox * checkbox1;
    IBOutlet LCCheckbox * checkbox2;
    IBOutlet LCCheckbox * checkbox3;
    IBOutlet LCCheckbox * checkbox4;

    
}



@end
