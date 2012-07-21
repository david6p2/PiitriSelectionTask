//
//  ParentPortalViewController.h
//  PiitriSelectionTask
//
//  Created by LSR Marketing Service on 20/07/12.
//  Copyright (c) 2012 LSR Marketing Service. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParentPortalViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *parentFullName;
@property (strong, nonatomic) IBOutlet UILabel *parentLocation;
@property (strong, nonatomic) IBOutlet UILabel *parentEmail;
@property (strong, nonatomic) IBOutlet UILabel *parentBirthday;
@property (strong, nonatomic) IBOutlet UIImageView *parentProfilePicture;
@property (strong, nonatomic) IBOutlet UITextView *cajaTextoParentPortal;
- (IBAction)disconnectFromFB:(id)sender;
- (void)useDatosLogin:(id)resultado withToken:(NSString *) accessToken;

@end
