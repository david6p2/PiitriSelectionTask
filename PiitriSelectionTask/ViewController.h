//
//  ViewController.h
//  PiitriSelectionTask
//
//  Created by LSR Marketing Service on 20/07/12.
//  Copyright (c) 2012 LSR Marketing Service. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *cajaTextoLogin;
@property (strong, nonatomic) IBOutlet UIButton *loginFBButton;
- (IBAction)connectWithFB:(id)sender;

@end
