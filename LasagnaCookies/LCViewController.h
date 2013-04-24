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
#import "LCTextField.h"

@interface LCViewController : UIViewController
{
    IBOutlet LCTextField * textfield;
    
    IBOutlet LCButton * button1;
    IBOutlet LCButton * button2;
    IBOutlet LCButton * button3;
    IBOutlet LCButton * button4;
    
    IBOutlet LCRadio * radio1;
    IBOutlet LCRadio * radio2;
    IBOutlet LCRadio * radio3;
    
    IBOutlet LCCheckbox * checkbox1;
    IBOutlet LCCheckbox * checkbox2;    
}



@end
